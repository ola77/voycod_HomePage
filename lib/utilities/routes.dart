import 'package:flutter/material.dart';
import 'package:home_page_ui_task/screens/homepage.dart';

const String HOME = '/';

class MRouter {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
