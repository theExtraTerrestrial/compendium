import 'package:compendium/core/viewmodels/home_viewmodel.dart';
import 'package:compendium/themes/anime_academy_theme.dart';
import 'package:compendium/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel.initial(),
      child: MaterialApp.router(
        title: 'Compendium',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AnimeAcademyTheme.lightTheme,
        darkTheme: AnimeAcademyTheme.darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}
