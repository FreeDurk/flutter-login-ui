import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_bud/app/authentication/model/registration_model.dart';
import 'package:my_bud/app/authentication/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future authentication() async {}

  void registration(
    BuildContext context,
    RegistrationModel registrationModel,
  ) async {
    emit(RegistrationInProgresState());
  }
}
