import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:home_page_ui_task/utilities/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(320, 676),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        //home: CartScreen(),
        theme: ThemeData(
            fontFamily: 'Cairo', scaffoldBackgroundColor: Colors.white),
        onGenerateRoute: MRouter.generateRoute,
      ),
    );
  }
}
