import 'package:flutter/material.dart';
import 'package:my_bud/app/authentication/repository/auth_repository.dart';

class Dashboard extends StatefulWidget {
  final Function onSignOut;
  const Dashboard({super.key, required this.onSignOut});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthRepository authRepo = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            authRepo.currentUser!.email.toString(),
            style: const TextStyle(color: Colors.red),
          ),
          ElevatedButton(
            child: const Text("Logout"),
            onPressed: () async {
              await authRepo.logout();
            },
          ),
        ],
      ),
    );
  }
}
