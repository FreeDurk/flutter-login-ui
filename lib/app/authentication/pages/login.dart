import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_bud/app/authentication/model/auth_model.dart';
import 'package:my_bud/app/authentication/repository/auth_repository.dart';
import 'package:my_bud/app/dashboard/dashboard.dart';
import 'package:my_bud/app/utils/button.dart';
import 'package:my_bud/app/authentication/pages/utils/header.dart';
import 'package:my_bud/app/authentication/pages/utils/input_fields.dart';
import 'package:my_bud/app/authentication/pages/utils/login_icons.dart';
import 'package:my_bud/constants/theme_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepo = AuthRepository();
  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StreamBuilder<User?>(
            stream: authRepo.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasData) {
                return Dashboard(onSignOut: () async {
                  await authRepo.logout();
                  clearFields();
                });
              } else {
                return _userSignInScreen(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Column _userSignInScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(title: "Log In"),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: InputFields(
            controller: emailController,
            title: "Email",
            placeholder: "Enter your emaill address.",
            isPassword: false,
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: InputFields(
            controller: passwordController,
            title: "Password",
            placeholder: "Enter your password.",
            isPassword: true,
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot Password?",
                style: TextStyle(
                  color: blkOpacity,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            AppButton(
              text: "Sign in",
              onTap: () async {
                AuthModel authModel = AuthModel(
                  email: emailController.text,
                  password: passwordController.text,
                );

                await authRepo.authenticate(authModel);
                clearFields();
              },
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: blkOpacity),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Sign up via",
              style: TextStyle(color: blkOpacity, fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginIcons(image: "assets/images/facebook.png"),
                SizedBox(
                  width: 7,
                ),
                LoginIcons(image: "assets/images/google.png")
              ],
            )
          ],
        )
      ],
    );
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
