import 'package:flower_shop/page/subject.dart';
// import 'package:flower_shop/page/subject_detail.dart';
import 'package:flower_shop/page/user.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/router.dart';
import 'package:flower_shop/path.dart' as Path;

import 'package:flower_shop/page/home.dart';

class MyApp extends StatelessWidget {
  static RouteFactory router = (RouteSettings settings) {
    PageRoute widget;
    route.pages.forEach((path, page) {
      if (path == settings.name) {
        var args = settings.arguments;
        if (args == null) {
          args = {
            'name': settings.name,
            'init': settings.isInitialRoute,
          };
        } else {
          (args as Map)['path'] = settings.name;
          (args as Map)['init'] = false;
        }
        widget = page.build(args, route);
      }
    });
    return widget;
  };

  MyApp() {
    // 实例化的时候给生成路由的回调函数添加路由
    route.add(Path.Home, HomePage());
    route.add(Path.User, UserPage());
    route.add(Path.Subject, SubjectPage());
    // route.add(Path.SubjectDetail, SubjectDetail());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router, // 生成路由的回调，使用一个工厂函数返回处理后的路由widget
      initialRoute: '/',
    );
  }
}
