import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigations/service/login.dart';
import 'package:navigations/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              )),
              const SizedBox(height: 20),
              const TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                      backgroundColor: Colors.grey,
                      text: 'Cancel',
                      onPressed: () {
                        GoRouter.of(context).go('/');
                      }),
                  const SizedBox(width: 8),
                  MyButton(
                      text: 'Login',
                      onPressed: () async {
                        String accessToken = await LoginService.getToken();
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('accessToken', accessToken);
                        if (!mounted) return;
                        GoRouter.of(context).push('/second');
                      }),
                ],
              ),
            ]),
      ),
    );
  }
}
