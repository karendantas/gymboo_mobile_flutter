import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_header_steps.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/card.dart';
import 'package:gymboo_app/shared/retro_text_field.dart';

class RegisterStep1Page extends ConsumerStatefulWidget {
  const RegisterStep1Page({super.key});

  @override
  ConsumerState<RegisterStep1Page> createState() => _RegisterStep1PageState();
}

class _RegisterStep1PageState extends ConsumerState<RegisterStep1Page> {
  final _nameController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _selectedDays = <int>{};

  String? _nameError;
  String? _daysError;

  static const weekdays = ['SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SÁB', 'DOM'];

  @override
  void initState() {
    super.initState();
    // restaura o que já foi preenchido, caso volte do passo 2
    final saved = ref.read(registrationFormControllerProvider);
    _nameController.text = saved.name;
    _heightController.text = saved.height?.toString() ?? '';
    _weightController.text = saved.weight?.toString() ?? '';
    _selectedDays.addAll(saved.selectedDays);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty ? 'Digite seu nome' : null;
      _daysError = _selectedDays.isEmpty ? 'Selecione ao menos 1 dia' : null;
    });
    return _nameError == null && _daysError == null;
  }

  void _handleNext() {
    if (!_validate()) return;

    ref.read(registrationFormControllerProvider.notifier).updateStep1(
          name: _nameController.text.trim(),
          height: int.tryParse(_heightController.text.trim()),
          weight: int.tryParse(_weightController.text.trim()),
          selectedDays: _selectedDays,
        );

    context.go('/register/pet');
  }

  Widget _fieldLabel(IconData icon, String text, GymbooPalette palette, TextTheme textTheme) {
    return Row(
      children: [
        Icon(icon, size: 16, color: palette.textPrimary),
        const SizedBox(width: 6),
        Text(text, style: textTheme.labelMedium?.copyWith(color: palette.textPrimary)),
      ],
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
          Image.asset('assets/images/bg-login.png', fit: BoxFit.cover, filterQuality: FilterQuality.none),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegistrationStepHeader(
                    currentStep: 1,
                    onBack: () => context.go('/onboarding'),
                    title: 'REGISTRO',
                    subtitle: 'Vamos começar! Conte um pouco\nsobre você para personalizar\nsua jornada.',
                  ),

                  RetroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _fieldLabel(Icons.person, 'NOME', palette, textTheme),
                        const SizedBox(height: 8),
                        RetroTextField(controller: _nameController, hintText: 'Digite seu nome', errorText: _nameError),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  RetroCard(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel(Icons.straighten, 'ALTURA', palette, textTheme),
                              const SizedBox(height: 8),
                              RetroTextField(
                                controller: _heightController,
                                hintText: '0,00 cm',
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]'))],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel(Icons.lock_outline, 'PESO', palette, textTheme),
                              const SizedBox(height: 8),
                              RetroTextField(
                                controller: _weightController,
                                hintText: '0,0 kg',
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9,]'))],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  RetroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _fieldLabel(Icons.calendar_month_rounded, 'DIAS QUE PRETENDE TREINAR', palette, textTheme),
                        const SizedBox(height: 12),
                        Row(
                          children: weekdays.map((day) {
                            final index = weekdays.indexOf(day);
                            final isSelected = _selectedDays.contains(index);
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 3),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        _selectedDays.remove(index);
                                      } else {
                                        _selectedDays.add(index);
                                      }
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected ? palette.primaryPink : Color.fromARGB(255, 245, 249, 215),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: palette.primaryPinkDark, width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: palette.primaryPinkDark,
                                          offset: Offset(0, 4),
                                          blurRadius: 0,
                                      
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      day,
                                      style: textTheme.labelSmall?.copyWith(
                                        color: isSelected ? Colors.white : palette.textPrimary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                     
                        if (_daysError != null) ...[
                          const SizedBox(height: 4),
                          Text(_daysError!, style: textTheme.labelSmall?.copyWith(color: palette.coral)),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  RetroButton(
                    title: 'Próximo',
                    width: double.infinity,
                    color: const Color(0xFFEB7098),
                    shadowColor: const Color(0xFFA22D5F),
                    onTap: _handleNext,
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