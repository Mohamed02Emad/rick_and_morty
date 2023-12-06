import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_router.dart';
import 'package:rick_and_morty/utils/my_colors.dart';

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
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   backgroundColor: MyColors.green,
        // ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
