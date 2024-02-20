import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stma/routes.dart';

import 'bindings/intialbindings.dart';

import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding:initialBindings() ,
      initialRoute: "splash",
      getPages: routes,
          );
  }
}
