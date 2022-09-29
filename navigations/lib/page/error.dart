import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigations/widget/button.dart';

class ErrorPage extends StatelessWidget {
  final Exception? error;
  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Error Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            Text(
              error!.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red),
            ),
            const SizedBox(height: 20),
            MyButton(
                backgroundColor: Colors.red,
                text: 'Go Home',
                onPressed: () {
                  context.go('/');
                })
          ],
        ));
  }
}
