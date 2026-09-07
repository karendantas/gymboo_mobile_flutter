import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_header_steps.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/card.dart';
import 'package:gymboo_app/shared/retro_text_field.dart';

class RegisterStep2Page extends ConsumerStatefulWidget {
  const RegisterStep2Page({super.key});

  @override
  ConsumerState<RegisterStep2Page> createState() => _RegisterStep2PageState();
}

class _RegisterStep2PageState extends ConsumerState<RegisterStep2Page> {
  final _petNameController = TextEditingController();
  PetColorOption _selectedColor = PetColorOption.blue;
  String? _petNameError;

  static const _colorAssets = {
    PetColorOption.blue: 'assets/images/pet_purple_neutral.png',
    PetColorOption.green: 'assets/images/pet_green_neutral.png',
    PetColorOption.yellow: 'assets/images/pet_yellow_neutral.png',
  };

  static const _colorSwatches = {
    PetColorOption.blue: Color(0xFF8FBBF3),
    PetColorOption.green: Color(0xFF8FD98F),
    PetColorOption.yellow: Color(0xFFF7D35C),
  };

  @override
  void initState() {
    super.initState();
    final saved = ref.read(registrationFormControllerProvider);
    _petNameController.text = saved.petName;
    _selectedColor = saved.petColor;
  }

  @override
  void dispose() {
    _petNameController.dispose();
    super.dispose();
  }

  void _handleNext() {
    setState(() {
      _petNameError = _petNameController.text.trim().isEmpty ? 'Dê um nome ao seu Gymboo' : null;
    });
    if (_petNameError != null) return;

    ref.read(registrationFormControllerProvider.notifier).updateStep2(
          petName: _petNameController.text.trim(),
          petColor: _selectedColor,
        );

    context.go('/register/goal');
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
                    currentStep: 2,
                    onBack: () => context.go('/register'),
                    title: 'SEU NOVO PET',
                    subtitle: 'Escolha o nome e a cor\ndo Gymboo que vai te acompanhar!',
                  ),

                  RetroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.edit, size: 16, color: palette.textPrimary),
                            const SizedBox(width: 6),
                            Text('NOME DO SEU GYMBOO',
                                style: textTheme.labelMedium?.copyWith(color: palette.textPrimary)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RetroTextField(
                          controller: _petNameController,
                          hintText: 'Ex: Fofurin, Bolt, Luna...',
                          errorText: _petNameError,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  RetroCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Escolha a cor do seu Gymboo',
                            style: textTheme.labelMedium?.copyWith(color: palette.textPrimary),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: PetColorOption.values.map((option) {
                            final isSelected = _selectedColor == option;
                            return GestureDetector(
                              onTap: () => setState(() => _selectedColor = option),
                              child: Container(
                                width: 56,
                                height: 56,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _colorSwatches[option],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? palette.primaryPinkDark : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: isSelected
                                    ? const Icon(Icons.check, color: Colors.white, size: 20)
                                    : null,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  RetroCard(
                    child: Column(
                      children: [
                        Image.asset(
                          _colorAssets[_selectedColor]!,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.none,
                        ),
                        const SizedBox(height: 8),
                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: List.generate(
                            5,
                            (i) => Image.asset('assets/images/heart_filled.png', width: 30, height: 30, filterQuality: FilterQuality.none),
                          ),
                        ),
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