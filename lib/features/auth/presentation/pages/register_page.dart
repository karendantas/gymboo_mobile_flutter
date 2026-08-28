import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/util/validate.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

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
          : (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)
              ? 'E-mail inválido'
              : null);

      _passwordError = validatePassword(_passwordController.text);

      _confirmPasswordError = _confirmPasswordController.text != _passwordController.text
          ? 'As senhas não coincidem'
          : null;
    });

    return _nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null;
  }

  void _handleRegister() {
    if (!_validate()) return;

    ref.read(authControllerProvider.notifier).register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          petName: 'Fofin'
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<GymbooPalette>()!;

    // Mesmo padrão do LoginPage: escuta erro assíncrono (ex.: e-mail já
    // cadastrado) e mostra num SnackBar, sem redirecionar sozinho — o
    // redirecionamento pra /home acontece pelo appRouterProvider quando
    // o AuthController.state deixar de ser null.
    ref.listen<AsyncValue>(authControllerProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao cadastrar: ${next.error}')),
        );
      }
    });

    final isLoading = ref.watch(authControllerProvider).isLoading;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 280,
                  height: 140,
                  filterQuality: FilterQuality.none,
                ),
                const SizedBox(height: 10),
                RetroTextField(
                  controller: _nameController,
                  label: 'Nome',
                  hintText: 'Seu nome completo',
                  errorText: _nameError,
                ),
                const SizedBox(height: 16),
                RetroTextField(
                  controller: _emailController,
                  label: 'E-mail',
                  hintText: 'seuemail@exemplo.com',
                  keyboardType: TextInputType.emailAddress,
                  errorText: _emailError,
                ),
                const SizedBox(height: 16),
                RetroTextField(
                  controller: _passwordController,
                  label: 'Senha',
                  hintText: '••••••••',
                  obscureText: true,
                  errorText: _passwordError,
                ),
                const SizedBox(height: 16),
                RetroTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirmar senha',
                  hintText: '••••••••',
                  obscureText: true,
                  errorText: _confirmPasswordError,
                ),
                const SizedBox(height: 30),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  RetroButton(
                    width: double.infinity,
                    title: 'Criar conta',
                    color: theme.primaryPink,
                    shadowColor: theme.primaryPinkDark,
                    onTap: _handleRegister,
                  ),
                const SizedBox(height: 20),
                RetroButton(
                  width: double.infinity,
                  title: 'Já tenho conta',
                  color: theme.primaryPinkDark,
                  shadowColor: theme.textSecondary,
                  onTap: () => context.pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}