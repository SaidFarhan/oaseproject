import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/model/app_table.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sp;

class AppSelecRepository {
  final supabase = sp.Supabase.instance.client;

  Future<void> insertApp(List<Appinfo> appinfo) async {
    var data = [];
    for (var item in appinfo) {
      print(String.fromCharCodes(item.appicon!.icon));
      var temp = app_table(
          user_id: supabase.auth.currentUser!.id,
          app_name: item.appicon!.appName,
          app_icon: base64Encode(item.appicon!.icon),
          app_packagename: item.appicon!.packageName);
      data.add(temp.toJson());
    }
    print(data);
    try {
      await supabase.from('app_table').insert(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<app_table>> getSelectedApp() async {
    try {
      final response = await supabase
          .from('app_table')
          .select()
          .eq('user_id', supabase.auth.currentUser!.id);
      debugPrint('respon : $response');
      List<app_table> appinfo = [];
      for (var appinfoprint in response) {
        appinfo.add(app_table.fromJson(appinfoprint));
      }

      print("jumlah aplikasi yang dipilih : ${appinfo.length}");

      return appinfo;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

final appSelecProviders = Provider<AppSelecRepository>((ref) {
  return AppSelecRepository();
});
