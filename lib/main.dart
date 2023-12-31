import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_project/view/cart_page.dart';
import 'package:store_project/view/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              // "/loadingPage":(context) => LoadingPage(),
              "/": (context) => const HomePage(),
              "/Cart": (context) => const CartPage(),
            },
          );
        });
  }
}
