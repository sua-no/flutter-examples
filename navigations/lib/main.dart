import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigations/page/error.dart';
import 'package:navigations/page/login.dart';
import 'package:navigations/page/second.dart';
import 'package:navigations/service/login.dart';
import 'package:navigations/widget/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MyHomePage(title: 'Go Router');
        },
      ),
      GoRoute(
          path: '/second',
          builder: (BuildContext context, GoRouterState state) {
            return const SecondPage();
          },
          redirect: (context, state) async {
            if (await LoginService.isLoggedIn()) {
              return null;
            }
            return '/login';
          }),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // go 새로운 경로로 점프. 기본 스택이 수정
              MyButton(
                  text: 'Go /second',
                  onPressed: () {
                    // GoRouter.of(context).go('/second');
                    context.go('/second');
                  }),
              // 기존 스택의 맨 위에 경로 push
              MyButton(
                  backgroundColor: Colors.blueAccent,
                  text: 'Push /second',
                  onPressed: () {
                    GoRouter.of(context).push('/second');
                  }),
              // 올바르지 않은 경로
              MyButton(
                  backgroundColor: Colors.deepOrange,
                  text: 'Go /wrongRoute',
                  onPressed: () {
                    GoRouter.of(context).go('/wrongRoute');
                  }),
            ],
          ),
        ));
  }
}
