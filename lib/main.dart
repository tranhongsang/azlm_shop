import 'package:azlm_shop/global/app_color.dart';
import 'package:azlm_shop/global/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
// await SystemChrome.setPreferredOrientations(
//         <DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AZLM Shop',
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: AppColor.white, elevation: 0),
          backgroundColor: AppColor.white,
          scaffoldBackgroundColor: AppColor.white),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      // home: const MyHomePage(),
      initialRoute: AppRouter.routerSplash,
      getPages: AppRouter.getPages,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
