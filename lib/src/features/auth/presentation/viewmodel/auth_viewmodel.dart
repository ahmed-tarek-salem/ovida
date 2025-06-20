import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ovida/src/core/services/dependency_injection/di_service.dart';
import 'package:ovida/src/core/services/local_storage/local_storage.dart';
import 'package:ovida/src/core/services/network/network_service.dart';
import 'package:ovida/src/core/shared/models/app_error_model.dart';
import 'package:ovida/src/core/shared/widgets/loading_overlay.dart';
import 'package:ovida/src/core/utilities/app_logger.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_request.dart';
import 'package:ovida/src/features/auth/data/models/sign_up_response.dart';
import 'package:ovida/src/features/auth/data/models/user_model.dart';
import 'package:ovida/src/features/auth/data/repositories/auth_repository.dart';
import 'package:ovida/src/features/auth/presentation/view/screens/auth_screen.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthRepository _repo;
  AuthViewmodel({required AuthRepository repo}) : _repo = repo;

  UserModel? userModel;
  AppError? error;
  bool loading = false;

  Future<void> _handleFcmToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        await _repo.postFcmToken(fcmToken);
        appLogger.d("FCM token sent successfully");
      }
    } catch (e) {
      appLogger.e("Error sending FCM token: $e");
    }
  }

  Future<void> signUp({
    required String phoneNumber,
    required String password,
  }) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final response = await _repo.signUp(
        SignUpRequest(
          password: password,
          phoneNumber: phoneNumber,
        ),
      );
      setUserAndToken(response);
      await _handleFcmToken();
    } on AppError catch (e) {
      error = e;
    } finally {
      appLogger.d("UserModel: $userModel");
      loading = false;
      notifyListeners();
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final response = await _repo.login(
        SignUpRequest(
          password: password,
          phoneNumber: phoneNumber,
        ),
      );
      setUserAndToken(response);
      await _handleFcmToken();
    } on AppError catch (e) {
      error = e;
    } finally {
      appLogger.d("UserModel: $userModel");
      loading = false;
      notifyListeners();
    }
  }

  void setUserAndToken(SignUpResponse response) {
    appLogger.d("Setting user and token from response: $response");
    userModel = response.user;
    di<NetworkService>().setToken(response.token);
    di<LocalStorage>().saveToken(response.token);
  }

  Future<void> logout(BuildContext context) async {
    appLogger.d("Logging out");
    try {
      LoadingOverlay.show();
      await _repo.logout();
      di<LocalStorage>().clearToken();
      userModel = null;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const AuthScreen();
      }));
    } on AppError catch (e) {
      appLogger.e("Logout failed: $e");
      LoadingOverlay.showErrorMessage("Logout failed: ${e.message}");
    } finally {
      LoadingOverlay.hide();
    }
  }
}
