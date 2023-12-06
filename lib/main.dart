import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_router.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen/characters_screen.dart';

void main() {
  runApp(
    RickAndMortyApp(
      appRouter: AppRouter(),
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
