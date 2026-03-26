import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/helpers/hive/hive_utils.dart';
import 'package:isd_tms/src/features/auth/data/models/login_dto.dart';
import 'package:isd_tms/src/features/auth/data/repo/auth_repo.dart';
import 'package:isd_tms/src/core/network/result/network_result.dart';
import 'package:isd_tms/src/core/network/result/error/network_exceptions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(const LoginInitial());
  final AuthRepo _repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordVisible = false;

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(TogglePasswordVisibility());
  }

  LoginDTO loginModel = LoginDTO();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    emit(const LoginLoading());
    final result = await _repo.login(loginModel);

    result.when(
      success: (response) async {
        if (response.accessToken != null && response.user != null) {
          await HiveUtils.setToken(response.accessToken!);
          await HiveUtils.setUser(response.user!);
          emit(const LoginSuccess());
        } else {
          emit(
            const LoginError('Login failed. Please check your credentials.'),
          );
        }
      },
      failure: (error) {
        emit(LoginError(NetworkExceptions.getErrorMessage(error)));
      },
    );
  }
}
