import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/getx_localization/languages.dart';
import 'package:getx_mvvm_project/res/routes/routes.dart';
import 'package:getx_mvvm_project/view/splash_screen.dart'; // Make sure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: Languages(),
      locale: Locale('ur_PK'),
      fallbackLocale: Locale('en_US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Optional: Enables Material 3 if needed
      ),
      getPages: AppRoutes.appRoutes(),      //  Route list from AppRoutes
    );
  }
}
