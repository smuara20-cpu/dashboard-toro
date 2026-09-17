import '../models/user_model.dart';

class AuthRemoteDataSource {
  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    // Concrete Identity & Access transport has not been authorized yet.
    // Do not simulate successful authentication.
    return null;
  }
}
