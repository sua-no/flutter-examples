import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigations/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Second Page'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(color: Colors.grey),
            MyButton(
                text: 'Navigation Pop',
                onPressed: () {
                  GoRouter.of(context).pop();
                }),
            MyButton(
                backgroundColor: Colors.grey,
                text: 'Logout',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.remove('accessToken');
                  if (!mounted) return;
                  context.go('/');
                })
          ]),
    );
  }
}
