import 'package:flutter/material.dart';
import 'package:autogen_registry_app/core/theme/app_theme.dart';
import 'package:autogen_registry_app/workflow/home/home_worflow.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RegistrAI',
        theme: AppTheme.defaultTheme(context),
        home: HomeWorflow.groupsPage());
  }
}
