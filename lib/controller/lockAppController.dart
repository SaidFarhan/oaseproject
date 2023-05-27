import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:oaseproject/widgets/profile.dart';

class appinfo {
  bool isselected;
  Application? appname;
  ApplicationWithIcon? appicon;
  appinfo(this.appname, this.appicon, {this.isselected = false});
}

class LockApp extends ChangeNotifier {
  List<appinfo> selectedApp = [];

  void selectedapp(appinfo select) {
    select.isselected = true;
    selectedApp.add(select);
    notifyListeners();
    print(selectedApp.length);
  }

  void unselectedapp(appinfo unselect) {
    unselect.isselected = false;
    selectedApp.remove(unselect);
    notifyListeners();
    print(selectedApp.length);
  }

  bool isSelected(appinfo getApp) {
    bool dipilih = selectedApp.contains(getApp);
    print(dipilih);
    return dipilih;
  }

  Future<List<appinfo>> getinstallerApp() async {
    final getapp = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    List<appinfo> tempapp = [];
    for (var i in getapp) {
      var app = appinfo(null, null);
      if (i is ApplicationWithIcon) {
        app.appicon = i;
        // print(i.icon);
      }

      app.appname = i;

      tempapp.add(app);
    }

    // print(tempapp);
    return tempapp;
  }
}

final lockAppProvider = ChangeNotifierProvider<LockApp>((ref) {
  return LockApp();
});

final getinstallerAppProvider =
    FutureProvider.autoDispose<List<appinfo>>((ref) async {
  final lockApp = LockApp();
  return await lockApp.getinstallerApp();
});
