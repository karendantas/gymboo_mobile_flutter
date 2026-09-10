import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/features/auth/data/auth_repository.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_step_header.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';

class RegisterStep3Page extends ConsumerStatefulWidget {
  const RegisterStep3Page({super.key});

  @override
  ConsumerState<RegisterStep3Page> createState() => _RegisterStep3PageState();
}

class _RegisterStep3PageState extends ConsumerState<RegisterStep3Page> {
  final _petNameController = TextEditingController();
  PetColorOption _selectedColor = PetColorOption.purple;
  String? _petNameError;

    static const _colorAssets = {
    PetColorOption.purple: 'assets/images/pet_purple_default.png',
    PetColorOption.green: 'assets/images/pet_green_default.png',
    PetColorOption.yellow: 'assets/images/pet_yellow_default.png',
  };

  static const _colorSwatches = {
    PetColorOption.purple: Color.fromARGB(255, 181, 143, 243),
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

  Future<void> _handleFinish() async {
    setState(() {
      _petNameError = _petNameController.text.trim().isEmpty ? 'Dê um nome ao seu Gymboo' : null;
    });
    if (_petNameError != null) return;

    final formNotifier = ref.read(registrationFormControllerProvider.notifier);
    formNotifier.updateStep3(petName: _petNameController.text.trim(), petColor: _selectedColor);
    final data = ref.read(registrationFormControllerProvider);

    final loggedInUser = ref.read(authControllerProvider).value;


    if (loggedInUser != null) {
    await ref.read(authControllerProvider.notifier).completeProfile(
          name: loggedInUser.name,
          heightCm: data.heightCm!,
          weightKg: data.weightKg!,
          workoutDays: data.workoutDays.toList(),
          petName: data.petName,
        );
    } else {
      await ref.read(authControllerProvider.notifier).register(
            RegisterPayload(
              fullName: data.name,
              email: data.email,
              password: data.password,
              workoutDays: data.workoutDays.toList(),
              weightKg: data.weightKg!,
              heightCm: data.heightCm!,
              petType: data.petColor.name,
              petName: data.petName,
            ),
          );
    }
    final result = ref.read(authControllerProvider);
    if (result.hasError) return; 
    if (result.value != null) formNotifier.reset();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;
    final isLoading = ref.watch(authControllerProvider).isLoading;

    ref.listen<AsyncValue>(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar: ${next.error}')),
        );
      }
    });

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
                  currentStep: 3,
                  onBack: () => context.go('/register/goal'),
                  title: 'SEU NOVO COMPANHEIRO',
                  subtitle: 'Escolha o nome e a cor\ndo seu Gymboo!',
                ),

                RetroTextField(
                  controller: _petNameController,
                  label: 'Nome do seu Gymboo',
                  hintText: 'Ex: Fofurin, Bolt, Luna...',
                  errorText: _petNameError,
                ),
                const SizedBox(height: 20),

                Text('Escolha a cor do seu Gymboo', style: textTheme.labelMedium?.copyWith(color: palette.textPrimary)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          border: Border.all(color: isSelected ? palette.primaryPinkDark : Colors.transparent, width: 3),
                        ),
                        child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 20) : null,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                Container(
                   width: double.infinity,
                    padding:  const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color:  const Color(0xFFFED3D6),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: palette.backgroundDark, width: 2),
                    ),
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
                const SizedBox(height: 32),

                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  RetroButton(
                    title: 'Concluir cadastro',
                    width: double.infinity,
                    color: palette.primaryPink,
                    shadowColor: palette.primaryPinkDark,
                    onTap: _handleFinish,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}