import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSource({SupabaseClient? client})
      : client = client ?? Supabase.instance.client;

  Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      return null;
    }

    final normalizedId = user.id.trim();
    final normalizedEmail = (user.email ?? '').trim();

    if (normalizedId.isEmpty || normalizedEmail.isEmpty) {
      return null;
    }

    return UserModel(
      id: normalizedId,
      email: normalizedEmail,
    );
  }

  Future<void> logout() async {
    await client.auth.signOut();
  }

  User? get currentUser => client.auth.currentUser;

  Session? get currentSession => client.auth.currentSession;
}
