import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/auth/domain/models/user.dart';
import 'package:gymboo_app/features/auth/presentation/controllers/auth_controller.dart';

const _fakeLoggedUser = User(
  id: 'mock-user-1',
  name: 'Karen Dantas',
  email: 'karen@teste.com',
  username: 'karen',
  height: 165,
  weight: 60,
);

class FakeLoggedInAuthController extends AuthController {
  @override
  Future<User?> build() async => _fakeLoggedUser;
}

final devOverrides = [
  authControllerProvider.overrideWith(FakeLoggedInAuthController.new),
];