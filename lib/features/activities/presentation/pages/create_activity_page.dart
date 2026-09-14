import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';
import '../controllers/activities_controller.dart';
import '../../domain/models/activity.dart';
import '../../domain/models/activity_category.dart';
import '../../domain/models/activity_category_display.dart';

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

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Editar atividade' : 'Nova atividade',
          style: textTheme.headlineSmall?.copyWith(
            color: palette.textSecondary,
          ),
        ),
        centerTitle: true,
        backgroundColor: palette.backgroundOuter,
      ),
      backgroundColor: palette.backgroundOuter,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RetroTextField(
              controller: _titleController,
              label: 'Título',
              hintText: 'Ex: Corrida no parque',
              errorText: _titleError,
            ),

            const SizedBox(height: 16),

            RetroTextField(
              controller: _durationController,
              label: 'Duração (minutos)',
              hintText: '30',
              keyboardType: TextInputType.number,
              errorText: _durationError,
            ),
            const SizedBox(height: 20),

            Text(
              'Categoria',
              style: textTheme.labelMedium?.copyWith(
                color: palette.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ActivityCategory.values.map((category) {
                final isSelected = _selectedCategory == category;
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = category),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? palette.primaryPink : palette.input,
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

            if (!_isEditing) ...[
              const SizedBox(height: 20),
              Text(
                'Data',
                style: textTheme.labelMedium?.copyWith(
                  color: palette.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: palette.input,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(255, 175, 179, 147),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: palette.primaryPinkDark,
                        offset: const Offset(0, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: palette.textPrimary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}',
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
                title: _isEditing ? 'Salvar alterações' : 'Adicionar atividade',
                width: double.infinity,
                color: palette.primaryPink,
                shadowColor: palette.primaryPinkDark,
                onTap: _handleSubmit,
              ),
          ],
        ),
      ),
    );
  }
}
