import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/util/validate.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_input.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    String? _passwordError;

  @override 
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void _handleLogin() {
     setState(() => _passwordError = validatePassword(_passwordController.text));
    if (_passwordError != null) return;

    ref.read(authControllerProvider.notifier).login(
      email: _emailController.text.trim(), 
      password: _passwordController.text
      );
  }


 @override
  Widget build(BuildContext context) {

        final theme = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    ref.listen<AsyncValue>(authControllerProvider, ((previous, next) {
        if (next.hasError && !next.isLoading){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro ao entrar: ${next.error}'))
            );
        }
    }));

    final isLoading = ref.watch(authControllerProvider).isLoading;


      return Scaffold(
        body: 
         Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image:  const DecorationImage(
              
          image: AssetImage('assets/images/login_bg.png'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
          ),
           child: Center(
            child: 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  Image.asset(
                    'assets/images/logo.png',
                    width: 400,
                    height: 200,
                    filterQuality: FilterQuality.none,
                  ),
           
                  RetroTextField(
                    controller: _emailController,
                    label: 'E-mail',
                    hintText: 'seuemail@exemplo.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  RetroTextField(
                    controller: _passwordController,
                    label: 'Senha',
                    hintText: '••••••••',
                    obscureText: true,
                    errorText: _passwordError,
                  ),
           
                     const SizedBox(height: 30),
                  if (isLoading)
                    const CircularProgressIndicator()
                  else
                    RetroButton(
                      width: double.infinity,
                      title: 'Entrar',
                      color: theme.primaryPink,
                      shadowColor: theme.primaryPinkDark,
                      onTap: _handleLogin,
                    ),
              
                     const SizedBox(height: 30,),
                     RetroButton(
                    width: double.infinity,
                    title: 'Criar conta', 
                    color: theme.primaryPinkDark, 
                    shadowColor: theme.textSecondary, 
                    onTap: () => context.go('/register')
                    )
                      
                ],
              ),
            )),
         ),
        );
  }
}
 