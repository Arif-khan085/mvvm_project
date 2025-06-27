
import 'package:get/get.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/view/login/login_view.dart';
import '../../view/splash_screen.dart';

class AppRoutes {

  static  appRoutes() => [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name:RoutesName.loginView,
      page: () => LoginView(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
