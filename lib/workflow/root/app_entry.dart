
import 'package:flutter/material.dart';
import 'package:plain_registry_app/core/theme/app_theme.dart';
import 'package:plain_registry_app/workflow/home/presenter/registries_page.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme(context),
      home: const RegistriesPage(),
    );
  }
}


