import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_step_header.dart';
import 'package:gymboo_app/features/goal/domain/models/weekday.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';

class RegisterStep2Page extends ConsumerStatefulWidget {
  const RegisterStep2Page({super.key});

  @override
  ConsumerState<RegisterStep2Page> createState() => _RegisterStep2PageState();
}

class _RegisterStep2PageState extends ConsumerState<RegisterStep2Page> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _selectedDays = <Weekday>{};

  String? _weightError;
  String? _heightError;
  String? _daysError;

  static const _weekOrder = [
    Weekday.MONDAY, Weekday.TUESDAY, Weekday.WEDNESDAY, Weekday.THURSDAY,
    Weekday.FRIDAY, Weekday.SATURDAY, Weekday.SUNDAY,
  ];
  static const _dayLabels = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB', 'DOM'];

  @override
  void initState() {
    super.initState();
    final saved = ref.read(registrationFormControllerProvider);
    _weightController.text = saved.weightKg?.toString() ?? '';
    _heightController.text = saved.heightCm?.toString() ?? '';
    _selectedDays.addAll(saved.workoutDays);
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  bool _validate() {
    final weight = int.tryParse(_weightController.text.trim());
    final height = int.tryParse(_heightController.text.trim());

    setState(() {
      _weightError = (weight == null || weight < 20 || weight > 400) ? 'Peso inválido (20–400 kg)' : null;
      _heightError = (height == null || height < 50 || height > 260) ? 'Altura inválida (50–260 cm)' : null;
      _daysError = _selectedDays.isEmpty ? 'Selecione ao menos 1 dia' : null;
    });

    return _weightError == null && _heightError == null && _daysError == null;
  }

  void _handleNext() {
    if (!_validate()) return;

    ref.read(registrationFormControllerProvider.notifier).updateStep2(
          weightKg: int.parse(_weightController.text.trim()),
          heightCm: int.parse(_heightController.text.trim()),
          workoutDays: _selectedDays,
        );

    context.go('/register/pet');
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/login_bg.png'), fit: BoxFit.cover, filterQuality: FilterQuality.none),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegistrationStepHeader(
                  currentStep: 2,
                  onBack: () => context.go('/register'),
                  title: 'SUAS METAS',
                  subtitle: 'Vamos personalizar seu\nplano de treino.',
                ),

                Row(
                  children: [
                    Expanded(
                      child: RetroTextField(
                        controller: _heightController,
                        label: 'Altura (cm)',
                        hintText: '165',
                        keyboardType: TextInputType.number,
                        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        errorText: _heightError,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RetroTextField(
                        controller: _weightController,
                        label: 'Peso (kg)',
                        hintText: '60',
                        keyboardType: TextInputType.number,
                        //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        errorText: _weightError,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Text('Dias que pretende treinar', style: textTheme.labelMedium?.copyWith(color: palette.textPrimary)),
                const SizedBox(height: 8),
                Row(
                  children: List.generate(7, (i) {
                    final day = _weekOrder[i];
                    final isSelected = _selectedDays.contains(day);
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
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
                              color: isSelected ? palette.primaryPink : palette.input,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: palette.primaryPinkDark, width: 2),
                            ),
                            child: Text(_dayLabels[i], style: textTheme.labelSmall?.copyWith(color: isSelected ? Colors.white : palette.textPrimary)),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                if (_daysError != null) ...[
                  const SizedBox(height: 4),
                  Text(_daysError!, style: textTheme.labelSmall?.copyWith(color: palette.coral)),
                ],
                const SizedBox(height: 28),

                RetroButton(
                  title: 'Próximo',
                  width: double.infinity,
                  color: palette.primaryPink,
                  shadowColor: palette.primaryPinkDark,
                  onTap: _handleNext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}