import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:loginapp/features/authentication/screens/on_boarding/onboarding.dart';
import 'package:loginapp/routes/app_routes.dart';
import 'package:loginapp/utils/constants/colors.dart';
import 'package:loginapp/utils/theme/theme.dart';
import 'bindings/general_bindings.dart';

///-- Use this class to setup themes,initial bindings,any animations and much more using material widget.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      //defaultTransition: Transition.leftToRightWithFade,
      //transitionDuration: const Duration(milliseconds: 5500),
      home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
