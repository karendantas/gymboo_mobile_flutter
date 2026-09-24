import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/health/health_service.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/activities/domain/models/health_map.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_tabbed.dart';

import '../../domain/models/activity.dart';
import '../../domain/models/activity_category.dart';
import '../../domain/models/activity_category_display.dart';
import '../controllers/activities_controller.dart';

class CreateActivityPage extends ConsumerStatefulWidget {
  const CreateActivityPage({super.key, this.existingActivity});

  final Activity? existingActivity;

  @override
  ConsumerState<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends ConsumerState<CreateActivityPage> {
  late final _titleController = TextEditingController(
    text: widget.existingActivity?.title ?? '',
  );
  late final _durationController = TextEditingController(
    text: widget.existingActivity?.durationMinutes.toString() ?? '',
  );

  ActivityCategory _selectedCategory = ActivityCategory.CARDIO;
  DateTime _selectedDate = DateTime.now();

  String? _titleError;
  String? _durationError;
  bool _isSubmitting = false;

  bool get _isEditing => widget.existingActivity != null;

  @override
  void initState() {
    super.initState();
    if (widget.existingActivity != null) {
      _selectedCategory = widget.existingActivity!.category;
      _selectedDate = DateTime.parse(widget.existingActivity!.activityDate);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _titleError = _titleController.text.trim().isEmpty
          ? 'Informe um título'
          : null;
      final duration = int.tryParse(_durationController.text.trim());
      _durationError = (duration == null || duration <= 0)
          ? 'Duração inválida'
          : null;
    });
    return _titleError == null && _durationError == null;
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _handleSubmit() async {
    if (_isSubmitting) return;
    if (!_validate()) return;

    setState(() => _isSubmitting = true);

    final controller = ref.read(activitiesControllerProvider.notifier);
    final title = _titleController.text.trim();
    final duration = int.parse(_durationController.text.trim());

    bool success;
    if (_isEditing) {
      success = await controller.editActivity(
        widget.existingActivity!.id,
        title: title,
        category: _selectedCategory,
        durationMinutes: duration,
      );
    } else {
      final dateStr = _selectedDate.toIso8601String().split('T').first;
      success = await controller.create(
        title: title,

        category: _selectedCategory,
        durationMinutes: duration,
        activityDate: dateStr,
      );
    }

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (success) {
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing
                ? 'Erro ao atualizar atividade'
                : 'Erro ao criar atividade',
          ),
        ),
      );
    }
  }

  Future<void> _handleImportFromHealth() async {
    final health = ref.read(healthServiceProvider);
    final granted = await health.requestPermissions();

    if (!granted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão do Health Connect negada')),
      );
      return;
    }

    final workouts = await health.getWorkoutsToday();

    if (workouts.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Nenhuma atividade encontrada hoje no Health Connect'),
        ),
      );
      return;
    }

    final workout = workouts.first;

    setState(() {
      _titleController.text = workoutTypeLabel(workout.activityType);
      _durationController.text = workout.durationMinutes.toString();
      _selectedCategory = mapHealthExerciseType(workout.activityType);
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Atividade importada! Confira os dados antes de salvar.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/images/login_bg.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: palette.textPrimary,
                        ),
                        onPressed: () => context.pop(),
                      ),
                      Expanded(
                        child: Text(
                          _isEditing ? 'Editar atividade' : 'Nova atividade',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            color: palette.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RetroTabbedField(
                    label: 'Título',
                    labelIcon: Icons.edit,

                    hintText: 'Ex: Corrida no parque',
                    controller: _titleController,
                    errorText: _titleError,
                  ),

                  const SizedBox(height: 16),

                  RetroTabbedField(
                    label: 'Duração (minutos)',
                    labelIcon: Icons.edit,

                    hintText: '30 minutos',
                    controller: _durationController,
                    errorText: _durationError,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 20),

                  RetroTabbedContainer(
                    label: 'Categoria',
                    labelIcon: Icons.category,
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ActivityCategory.values.map((category) {
                        final isSelected = _selectedCategory == category;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedCategory = category),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? palette.primaryPink
                                  : palette.input,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: palette.primaryPinkDark,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                category.icon,
                                const SizedBox(width: 6),
                                Text(
                                  category.label,
                                  style: textTheme.labelSmall?.copyWith(
                                    color: isSelected
                                        ? Colors.white
                                        : palette.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  if (!_isEditing) ...[
                    const SizedBox(height: 20),
                    RetroTabbedContainer(
                      label: 'Data',
                      labelIcon: Icons.calendar_month,
                      child: GestureDetector(
                        onTap: _pickDate,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              '${_selectedDate.day.toString().padLeft(2, '0')}/'
                              '${_selectedDate.month.toString().padLeft(2, '0')}/'
                              '${_selectedDate.year}',
                              style: textTheme.bodyMedium?.copyWith(
                                color: palette.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),
                  if (_isSubmitting)
                    const Center(child: CircularProgressIndicator())
                  else
                    RetroButton(
                      title: _isEditing
                          ? 'Salvar alterações'
                          : 'Adicionar atividade',
                      width: double.infinity,
                      color: palette.primaryPink,
                      shadowColor: palette.primaryPinkDark,
                      onTap: _handleSubmit,
                    ),

                  const SizedBox(height: 20),
                  RetroButton(
                    title: 'Importar Health Connect',
                    color: palette.backgroundOuter,
                    shadowColor: palette.backgroundDark,
                    width: double.infinity,
                    onTap: _handleImportFromHealth,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
