import 'package:azlm_shop/page/login/login_page.dart';
import 'package:azlm_shop/page/main/main_page.dart';
import 'package:azlm_shop/page/splash/splash_page.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String routerSplash = '/';
  static const String routerMain = '/routerMain';
  static const String routerLogin = '/routerLogin';

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SplashPage>(
      name: routerSplash,
      page: () => const SplashPage(),
    ),
    GetPage<MainPage>(
      name: routerMain,
      page: () => const MainPage(),
    ),
    GetPage<LoginPage>(
      name: routerLogin,
      page: () => const LoginPage(),
    ),
  ];
}
