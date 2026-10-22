import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/toast/toast_provider.dart';
import 'package:gymboo_app/features/activities/domain/models/activity_category.dart';
import 'package:gymboo_app/features/activities/presentation/controllers/activities_controller.dart';
import 'package:gymboo_app/features/jump_rope_minigame/presentation/controller/jump_rope_controller.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';

class JumpRopePage extends ConsumerStatefulWidget {
  const JumpRopePage({super.key});

  @override
  ConsumerState<JumpRopePage> createState() => _JumpRopePageState();
}

class _JumpRopePageState extends ConsumerState<JumpRopePage> {
  String? _precachedType;

  String _idleAsset(String type) => 'assets/images/pet_${type}_idle.png';
  String _jumpAsset(String type) => 'assets/images/pet_${type}_jump.png';

  bool _jumping = false;
  Timer? _jumpTimer;
  bool _saving = false;

  @override
  void dispose() {
    _jumpTimer?.cancel();
    super.dispose();
  }

  void _onJump() {
    _jumpTimer?.cancel();
    setState(() => _jumping = true);
    _jumpTimer = Timer(const Duration(milliseconds: 250), () {
      if (mounted) setState(() => _jumping = false);
    });
  }

  String _fmt(int s) =>
      '${(s ~/ 60).toString().padLeft(2, '0')}:${(s % 60).toString().padLeft(2, '0')}';

  Future<void> _finish() async {
    final controller = ref.read(jumpRopeControllerProvider.notifier);
    controller.finish();
    final s = ref.read(jumpRopeControllerProvider);
    final messenger = ScaffoldMessenger.of(context);

    if (s.jumps == 0) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Nenhum pulo detectado, nada foi registrado.'),
        ),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final minutes = max(1, (s.seconds / 60).round());

      final success = await ref
          .read(activitiesControllerProvider.notifier)
          .create(
            title: 'Pular corda (${s.jumps} pulos)',
            category: ActivityCategory.CARDIO,
            durationMinutes: minutes,
            activityDate: DateTime.now().toIso8601String().split('T').first,
          );

      if (!mounted) return;
      if (success) {
        ref
            .read(toastServiceProvider)
            .success('Atividade registrada: ${s.jumps} pulos em $minutes min');
      } else {
        ref
            .read(toastServiceProvider)
            .error('Não foi possível registrar a atividade.');
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textTheme = Theme.of(context).textTheme;

    final type =
        ref.watch(petControllerProvider).value?.type.toLowerCase() ?? 'purple';
    if (_precachedType != type) {
      _precachedType = type;
      precacheImage(AssetImage(_idleAsset(type)), context);
      precacheImage(AssetImage(_jumpAsset(type)), context);
    }

    ref.listen<int>(jumpRopeControllerProvider.select((s) => s.jumps), (
      prev,
      next,
    ) {
      if (next > (prev ?? 0)) _onJump();
    });

    final s = ref.watch(jumpRopeControllerProvider);
    final running = s.status == JumpRopeStatus.running;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: palette.textPrimary),
                    onPressed: () => context.go('/pet'),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          'PULA CORDA',
                          style: textTheme.headlineSmall?.copyWith(
                            color: palette.primaryPinkDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Stat(label: 'Pulos', value: '${s.jumps}'),
                  _Stat(label: 'Tempo', value: _fmt(s.seconds)),
                ],
              ),
              Expanded(
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    curve: Curves.easeOut,
                    transform: Matrix4.translationValues(
                      0,
                      _jumping ? -60 : 0,
                      0,
                    ),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.none,
                      _jumping ? _jumpAsset(type) : _idleAsset(type),
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
              ),
              if (!running)
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Coloque o celular no bolso e comece a pular.',
                    textAlign: TextAlign.center,
                  ),
                ),

              RetroButton(
                width: double.infinity,
                color: palette.primaryPink,
                shadowColor: palette.primaryPinkDark,
                onTap: () {
                  if (_saving) return;
                  if (running) {
                    _finish();
                  } else {
                    ref.read(jumpRopeControllerProvider.notifier).start();
                  }
                },
                title: running ? 'Finalizar' : 'Começar',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(value, style: Theme.of(context).textTheme.displayMedium),
      Text(label),
    ],
  );
}
