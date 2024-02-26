import 'package:app_demo_gemini/config/router/app_router.dart';
import 'package:app_demo_gemini/config/theme/app_theme.dart';
import 'package:app_demo_gemini/domain/bloc/blocs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const BlocsProvider());

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RouterSimpleCubit()),
        BlocProvider(create: (context) => AppGeminiCubit()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    return MaterialApp.router(
      title: 'App Gemini',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
