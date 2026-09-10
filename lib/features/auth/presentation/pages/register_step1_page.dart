import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/util/validate.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/auth/presentation/widgets/registration_step_header.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';

class RegisterStep1Page extends ConsumerStatefulWidget {
  const RegisterStep1Page({super.key});

  @override
  ConsumerState<RegisterStep1Page> createState() => _RegisterStep1PageState();
}

class _RegisterStep1PageState extends ConsumerState<RegisterStep1Page> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void initState() {
    super.initState();
    final saved = ref.read(registrationFormControllerProvider);
    _nameController.text = saved.name;
    _emailController.text = saved.email;
    _passwordController.text = saved.password;
    _confirmPasswordController.text = saved.password;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validate() {
    setState(() {
      _nameError = _nameController.text.trim().isEmpty ? 'Informe seu nome' : null;

      final email = _emailController.text.trim();
      _emailError = email.isEmpty
          ? 'Informe seu e-mail'
          : (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email) ? 'E-mail inválido' : null);

      _passwordError = validatePassword(_passwordController.text);
      _confirmPasswordError =
          _confirmPasswordController.text != _passwordController.text ? 'As senhas não coincidem' : null;
    });

    return _nameError == null && _emailError == null && _passwordError == null && _confirmPasswordError == null;
  }

  void _handleNext() {
    if (!_validate()) return;

    ref.read(registrationFormControllerProvider.notifier).updateStep1(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

    context.go('/register/goal');
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;

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
                  currentStep: 1,
                  onBack: () => context.go('/onboarding'),
                  title: 'REGISTRO',
                  subtitle: 'Vamos começar! Conte um pouco\nsobre você.',
                ),
                RetroTextField(controller: _nameController, label: 'Nome', hintText: 'Seu nome completo', errorText: _nameError),
                const SizedBox(height: 16),
                RetroTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  hintText: 'seuemail@exemplo.com',
                  keyboardType: TextInputType.emailAddress,
                  errorText: _emailError,
                ),
                const SizedBox(height: 16),
                RetroTextField(controller: _passwordController, label: 'Senha', hintText: '••••••••', obscureText: true, errorText: _passwordError),
                const SizedBox(height: 16),
                RetroTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirmar senha',
                  hintText: '••••••••',
                  obscureText: true,
                  errorText: _confirmPasswordError,
                ),
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