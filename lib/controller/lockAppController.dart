import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:oaseproject/utils/common.dart';
import 'package:oaseproject/widgets/profile.dart';

class Appinfo {
  bool isselected;
  Application? appname;
  ApplicationWithIcon? appicon;
  Appinfo(this.appname, this.appicon, {this.isselected = false});
}

class LockApp extends ChangeNotifier {
  List<Appinfo> selectedApp = [];
  bool lockbtn = false;

  void afterLock() {
    lockbtn = !lockbtn;
    notifyListeners();
  }

  void selectedapp(Appinfo select) {
    select.isselected = true;
    selectedApp.add(select);
    notifyListeners();
    print(selectedApp.length);
    print(client.auth.currentUser?.id);
    print(select.appicon?.appName);
    print(select.appicon?.packageName);
    print(select.appicon?.icon);
    // print(select.appname);
  }

  void unselectedapp(Appinfo unselect) {
    unselect.isselected = false;
    selectedApp.remove(unselect);
    notifyListeners();
    print(selectedApp.length);
  }

  bool isSelected(Appinfo getApp) {
    bool dipilih = selectedApp.contains(getApp);
    print(dipilih);
    return dipilih;
  }

  Future<List<Appinfo>> getinstallerApp() async {
    final getapp = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
    List<Appinfo> tempapp = [];
    for (var i in getapp) {
      var app = Appinfo(null, null);
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
    FutureProvider.autoDispose<List<Appinfo>>((ref) async {
  final lockApp = LockApp();
  return await lockApp.getinstallerApp();
});
