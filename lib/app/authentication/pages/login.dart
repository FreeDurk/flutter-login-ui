import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  onTap: () {
                    Navigator.pushNamed(context, '/dashboard');
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
        ),
      ),
    );
  }
}
