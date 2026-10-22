import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gymboo_app/core/theme/gymboo_palette.dart';
import 'package:gymboo_app/core/toast/toast_provider.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/registration_form_controller.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/virtual_pet.dart';
import 'package:gymboo_app/features/virtual_pet/presentation/controllers/pet_controller.dart';
import 'package:gymboo_app/shared/retro_button.dart';
import 'package:gymboo_app/shared/retro_tabbed.dart';

class EditPetPage extends ConsumerStatefulWidget {
  const EditPetPage({super.key});

  @override
  ConsumerState<EditPetPage> createState() => _EditPetPageState();
}

class _EditPetPageState extends ConsumerState<EditPetPage> {
  PetColorOption? selectedColor;
  final petNameController = TextEditingController();

  bool _isEditing = false;

  PetColorOption? colorFromString(String? color) {
    if (color == null) return null;

    return PetColorOption.values.firstWhere(
      (option) => option.name == color,
      orElse: () => PetColorOption.purple,
    );
  }

  @override
  void dispose() {
    petNameController.dispose();
    super.dispose();
  }

  void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/home');
    }
  }

  static const colorSwatches = {
    PetColorOption.purple: Color.fromARGB(255, 181, 143, 243),
    PetColorOption.green: Color(0xFF8FD98F),
    PetColorOption.yellow: Color(0xFFF7D35C),
  };

  void handleEditPet(VirtualPet pet) async {
    if (_isEditing) return;

    final toast = ref.read(toastServiceProvider);
    final typedName = petNameController.text.trim();
    final newType = selectedColor?.name;

    final nameChanged = typedName.isNotEmpty && typedName != pet.name;
    final colorChanged = newType != null && newType != pet.type;

    if (!nameChanged && !colorChanged) {
      toast.info('Nada foi alterado');
      return;
    }

    setState(() => _isEditing = true);

    try {
      final success = await ref
          .read(petControllerProvider.notifier)
          .edit(
            name: nameChanged ? typedName : null,
            type: colorChanged ? newType : null,
          );
      if (!mounted) return;
      if (success) {
        toast.success('Gymboo atualizado!');
      } else {
        toast.error('Não foi possível atualizar o Gymboo');
      }
    } finally {
      if (mounted) setState(() => _isEditing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).extension<GymbooPalette>()!;
    final textStyle = Theme.of(context).textTheme;

    final pet = ref.watch(petControllerProvider).value;

    selectedColor ??= colorFromString(pet?.type);

    if (pet == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'EDITAR GYMBOO',
          style: textStyle.labelLarge?.copyWith(color: palette.primaryPinkDark),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: palette.primaryPinkDark),
          onPressed: () => goBack(context),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage('assets/images/login_bg.png'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),

              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const SizedBox(height: 20),
                    RetroTabbedField(
                      label: 'Renomear pet',
                      labelIcon: Icons.edit,
                      hintText: pet.name,
                      controller: petNameController,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: PetColorOption.values.map((option) {
                        final isSelected = selectedColor == option;
                        return GestureDetector(
                          onTap: () => setState(() => selectedColor = option),
                          child: Container(
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorSwatches[option],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? palette.primaryPinkDark
                                    : Colors.transparent,
                                width: 3,
                              ),
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),
                    if (_isEditing)
                      const Center(child: CircularProgressIndicator())
                    else
                      RetroButton(
                        title: 'Salvar',
                        width: double.infinity,
                        color: palette.primaryPink,
                        shadowColor: palette.primaryPinkDark,
                        onTap: () => handleEditPet(pet),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
