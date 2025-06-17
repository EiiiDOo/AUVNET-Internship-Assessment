import 'package:auvnet_internship_assessment/core/constants/user_keys.dart';
import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/services/remote_cloud_services.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthServiceImpl implements RemoteCloudServices {
  final SupabaseClient client;

  SupabaseAuthServiceImpl({required this.client});

  @override
  Future<UserModel?> getUser() async {
    try {
      final user = client.auth.currentUser;
      return user != null
          ? UserModel(email: user.email ?? UserErrorKeys.userWIthoutEmail)
          : null;
    } on AuthApiException catch (e) {
      throw AuthFailure(e.message);
    } on PostgrestException catch (e) {
      throw AuthFailure("Database error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      final res = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      //TEMP: in next version xd :)
      // final Session? session = res.session;

      final User? user = res.user;
      return user != null
          ? UserModel(email: user.email ?? UserErrorKeys.userWIthoutEmail)
          : null;
    } on AuthApiException catch (e) {
      throw AuthFailure(e.message);
    } on PostgrestException catch (e) {
      throw AuthFailure("Database error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await client.auth.signOut();
    } on AuthApiException catch (e) {
      throw AuthFailure(e.message);
    } on PostgrestException catch (e) {
      throw AuthFailure("Database error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }

  @override
  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      final res = await client.auth.signUp(password: password, email: email);
      //TEMP: in next version xd :)
      // final Session? session = res.session;

      final User? user = res.user;
      return user != null
          ? UserModel(email: user.email ?? UserErrorKeys.userWIthoutEmail)
          : null;
    } on AuthApiException catch (e) {
      throw AuthFailure(e.message);
    } on PostgrestException catch (e) {
      throw AuthFailure("Database error: ${e.message}");
    } catch (e) {
      throw UnknownFailure();
    }
  }
}
