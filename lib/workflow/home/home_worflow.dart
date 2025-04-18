import 'package:autogen_registry_app/workflow/home/presenter/pages/new_registry/new_registry_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:autogen_registry_app/core/services/app_cameras.dart';
import 'package:autogen_registry_app/data/local_database/app_local_db.dart';
import 'package:autogen_registry_app/workflow/home/domain/i_repositories/i_registry_groups_repository.dart';
import 'package:autogen_registry_app/workflow/home/domain/i_repositories/i_registry_repository.dart';
import 'package:autogen_registry_app/workflow/home/external/groups/registry_groups_repository.dart';
import 'package:autogen_registry_app/workflow/home/external/registries/registries_repository.dart';
import 'package:autogen_registry_app/workflow/home/presenter/pages/groups/registry_groups_page.dart';
import 'package:autogen_registry_app/workflow/home/presenter/pages/groups/registry_groups_provider.dart';
import 'package:autogen_registry_app/workflow/home/presenter/pages/registries/opened_registries_group_page.dart';
import 'package:autogen_registry_app/workflow/home/presenter/pages/registries/registries_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class HomeWorflow {
  static void register() {
    GetIt.I.registerSingleton<AppCameras>(AppCameras.instance);
    GetIt.I.registerSingleton<Database>(AppLocalDb.instance.localDatabase);
    GetIt.I.registerSingleton<IRegistryGroupsRepository>(RegistryGroupsRepository(GetIt.I.get()));
    GetIt.I.registerSingleton<IRegistriesRepository>(RegistriesRepository(GetIt.I.get()));
  }

  static Widget openedRegistryGroupPage(String param) =>
      ChangeNotifierProvider<RegistriesProvider>(
        create: (context) => RegistriesProvider(GetIt.I.get()),
        builder: (context, child) =>
            child ??
            const Center(
              child: CircularProgressIndicator(),
            ),
        child: OpenedRegistriesGroupPage(group: param),
      );

  static Widget groupsPage() => ChangeNotifierProvider<RegistryGroupsProvider>(
        create: (context) => RegistryGroupsProvider(GetIt.I.get()),
        builder: (context, child) => child!,
        
        child: const RegistryGroupsPage(),
      );

  static Widget newRegistryPage({List<String>? groups, String? specificGroup}) =>
      NewRegistryPage(groups: groups, specificGroup: specificGroup,);
}
