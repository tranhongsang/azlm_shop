import 'package:azlm_shop/global/app_path.dart';
import 'package:azlm_shop/global/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // late Timer _timer;
  @override
  void initState() {
    super.initState();
    2.seconds.delay(() {
      Get.offAllNamed(AppRouter.routerLogin);
    });
    // _timer.periodic(const Duration(seconds: 2), (_) {
    //   Get.offAllNamed(AppRouter.routerLogin);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppPath.imageAZLM),
      ),
    );
  }
}
