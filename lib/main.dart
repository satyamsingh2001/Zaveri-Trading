import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:gogrow/language/localizetion_services.dart';
import 'package:gogrow/screens/Splash_Screen/Splash_Screen.dart';
import 'Custom_BlocObserver/Custom_BlocObserver.dart';
import 'Custom_BlocObserver/notifire_clor.dart';

void main() async {
  await GetStorage.init();
  BlocOverrides.runZoned(
    () => runApp(  App()),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
    App({Key? key}) : super(key: key);

  final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: localizationController,
        builder: (LocalizationController controller) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ColorNotifier()),
            ],
            child: GetMaterialApp(
              locale: controller.currentLanguage != ''
                  ? Locale(controller.currentLanguage, '')
                  : null,
              localeResolutionCallback:
                  LocalizationService.localResolutioncallBack,
              supportedLocales: LocalizationService.supportedlocales,
              localizationsDelegates: LocalizationService.localizationsDelegate,
              debugShowCheckedModeBanner: false,
              home: Spash_Screen(),
            ),
          );
        });
  }
}
