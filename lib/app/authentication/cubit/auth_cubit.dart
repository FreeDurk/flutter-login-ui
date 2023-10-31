import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
          ),
        );
      },
    );

    await authRepo.registration(registrationModel);
    Future.delayed(const Duration(seconds: 3), () {
      emit(RegistrationSuccessState());
    });
  }
}
