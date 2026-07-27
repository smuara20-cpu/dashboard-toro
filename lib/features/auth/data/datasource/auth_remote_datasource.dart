import '../models/user_model.dart';

class AuthRemoteDataSource {
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    // Simulasi login
    await Future.delayed(const Duration(seconds: 1));

    return UserModel(
      id: "1",
      name: "Toro",
      email: email,
      role: "CEO",
    );
  }
}