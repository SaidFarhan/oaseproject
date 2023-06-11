import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oaseproject/controller/lockAppController.dart';
import 'package:oaseproject/model/app_table.dart';
import 'package:oaseproject/repositories/appselec.dart';

class AppselectControllerNotifier
    extends StateNotifier<AsyncValue<List<app_table>>> {
  AppselectControllerNotifier(this.appSelecRepository)
      : super(AsyncValue.data([]));

  final AppSelecRepository appSelecRepository;

  Future insert_dataapp(List<Appinfo> appinfo) async {
    await appSelecRepository.insertApp(appinfo);
  }

  Future<void> get_dataapp() async {
    state = const AsyncValue.loading();
    final result = await appSelecRepository.getSelectedApp();

    state = AsyncData(result);
  }
}

final AppSelecProvider = StateNotifierProvider<AppselectControllerNotifier,
    AsyncValue<List<app_table>>>((ref) {
  final repo = ref.watch(appSelecProviders);
  return AppselectControllerNotifier(repo)..get_dataapp();
});
