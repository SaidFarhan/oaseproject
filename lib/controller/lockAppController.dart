import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:oaseproject/widgets/profile.dart';

class LockApp extends ChangeNotifier {
  List<Application> selectedApp = [];
  Future<List<Application>> getinstallerApp() async {
    final getapp = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );

    print(getapp);
    return getapp;
  }
}

final lockAppProvider = Provider<LockApp>((ref) {
  return LockApp();
});

final getinstallerAppProvider = FutureProvider<List<Application>>((ref) async {
  final lockApp = LockApp();
  return await lockApp.getinstallerApp();
});
