import 'package:flutter/foundation.dart' show setEquals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/domain/models/user.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/goal/data/goal_repository.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/features/goal/presentation/controllers/goal_controller.dart';
import 'package:gymboo_app/features/home/presentation/controllers/home_controller.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_tabbed.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    final user = ref.watch(authControllerProvider).value;
    final petAsync = ref.watch(petControllerProvider);
    final progressAsync = ref.watch(weeklyProgressControllerProvider);

    final pet = petAsync.value;
    final progress = progressAsync.value;

    final Widget content;
    if (user != null && pet != null && progress != null) {
      content = _EditProfileForm(
        user: user,
        pet: pet,
        plannedDays: progress.plannedDays,
      );
    } else if (petAsync.hasError || progressAsync.hasError) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Não foi possível carregar seus dados',
              style: textTheme.bodyMedium?.copyWith(color: palette.coral),
            ),
            const SizedBox(height: 16),
            RetroButton(
              title: 'Tentar de novo',
              color: palette.primaryPink,
              shadowColor: palette.primaryPinkDark,
              onTap: () {
                ref.invalidate(petControllerProvider);
                ref.invalidate(weeklyProgressControllerProvider);
              },
            ),
          ],
        ),
      );
    } else {
      content = const Center(child: CircularProgressIndicator());
    }

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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
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
                          'Editar perfil',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            color: palette.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 48,
                      ), // compensa o IconButton, centraliza o título de verdade
                    ],
                  ),
                ),
                Expanded(child: content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EditProfileForm extends ConsumerStatefulWidget {
  const _EditProfileForm({
    required this.user,
    required this.pet,
    required this.plannedDays,
  });

  final User user;
  final VirtualPet pet;
  final List<Weekday> plannedDays;

  @override
  ConsumerState<_EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<_EditProfileForm> {
  late final _nameController = TextEditingController(text: widget.user.name);
  late final _heightController = TextEditingController(
    text: widget.user.heightCm?.toString() ?? '',
  );
  late final _weightController = TextEditingController(
    text: widget.user.weightKg?.toString() ?? '',
  );
  late final _petNameController = TextEditingController(text: widget.pet.name);
  late final Set<Weekday> _selectedDays = {...widget.plannedDays};

  String? _nameError;
  String? _heightError;
  String? _weightError;
  String? _petNameError;
  String? _daysError;
  bool _isSaving = false;

  static const _weekOrder = [
    Weekday.MONDAY,
    Weekday.TUESDAY,
    Weekday.WEDNESDAY,
    Weekday.THURSDAY,
    Weekday.FRIDAY,
    Weekday.SATURDAY,
    Weekday.SUNDAY,
  ];
  static const _dayLabels = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB', 'DOM'];

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _petNameController.dispose();
    super.dispose();
  }

  bool _validate() {
    final height = int.tryParse(_heightController.text.trim());
    final weight = int.tryParse(_weightController.text.trim());

    setState(() {
      _nameError = _nameController.text.trim().isEmpty
          ? 'Informe seu nome'
          : null;
      _heightError = (height == null || height < 50 || height > 260)
          ? 'Altura inválida (50–260 cm)'
          : null;
      _weightError = (weight == null || weight < 20 || weight > 400)
          ? 'Peso inválido (20–400 kg)'
          : null;
      _petNameError = _petNameController.text.trim().isEmpty
          ? 'Dê um nome ao seu Gymboo'
          : null;
      _daysError = _selectedDays.isEmpty ? 'Selecione ao menos 1 dia' : null;
    });

    return _nameError == null &&
        _heightError == null &&
        _weightError == null &&
        _petNameError == null &&
        _daysError == null;
  }

  Future<void> _handleSave() async {
    if (_isSaving || !_validate()) return;
    setState(() => _isSaving = true);

    final name = _nameController.text.trim();
    final height = int.parse(_heightController.text.trim());
    final weight = int.parse(_weightController.text.trim());

    var failed = false;
    try {
      if (name != widget.user.name ||
          height != widget.user.heightCm ||
          weight != widget.user.weightKg) {
        await ref
            .read(authControllerProvider.notifier)
            .updateProfile(name: name, heightCm: height, weightKg: weight);
      }
      if (!setEquals(_selectedDays, widget.plannedDays.toSet())) {
        await ref
            .read(goalRepositoryProvider)
            .updateGoal(workoutDays: _selectedDays.toList());
      }
    } catch (_) {
      failed = true;
    }

    ref.invalidate(homeDataProvider);
    ref.invalidate(petControllerProvider);
    ref.invalidate(weeklyProgressControllerProvider);

    if (!mounted) return;
    setState(() => _isSaving = false);

    if (failed) {
      // se já aplicou o ToastService, troque por ref.read(toastServiceProvider).error(...)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Erro ao salvar. Algumas alterações podem ter sido aplicadas.',
          ),
        ),
      );
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RetroTabbedField(
            label: 'Nome',
            labelIcon: Icons.person,
            hintText: 'Seu nome',
            controller: _nameController,
            errorText: _nameError,
          ),
          const SizedBox(height: 20),

          RetroTabbedContainer(
            label: 'E-mail',
            labelIcon: Icons.lock_outline,
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 18,
                  color: palette.primaryPinkDark,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.user.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: palette.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(
              'O e-mail não pode ser alterado.',
              style: textTheme.labelSmall?.copyWith(
                color: palette.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: RetroTabbedField(
                  label: 'Altura',
                  labelIcon: Icons.height,
                  hintText: '165 cm',
                  controller: _heightController,
                  errorText: _heightError,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: RetroTabbedField(
                  label: 'Peso',
                  labelIcon: Icons.monitor_weight_outlined,
                  hintText: '60 kg',
                  controller: _weightController,
                  errorText: _weightError,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          RetroTabbedContainer(
            label: 'Dias de treino',
            labelIcon: Icons.calendar_month,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(7, (i) {
                    final day = _weekOrder[i];
                    final isSelected = _selectedDays.contains(day);
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            if (isSelected) {
                              _selectedDays.remove(day);
                            } else {
                              _selectedDays.add(day);
                            }
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? palette.primaryPink
                                  : palette.input,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: palette.primaryPinkDark,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              _dayLabels[i],
                              style: textTheme.labelSmall?.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : palette.textPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                if (_daysError != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    _daysError!,
                    style: textTheme.labelSmall?.copyWith(color: palette.coral),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),

          if (_isSaving)
            const Center(child: CircularProgressIndicator())
          else
            RetroButton(
              title: 'Salvar alterações',
              width: double.infinity,
              color: palette.primaryPink,
              shadowColor: palette.primaryPinkDark,
              onTap: _handleSave,
            ),
        ],
      ),
    );
  }
}
