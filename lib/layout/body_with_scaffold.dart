import 'package:flutter/material.dart';
import 'package:flower_shop/path.dart' as Path;
import 'package:flower_shop/router.dart';

typedef Widget BuildFn(BuildContext ctx, Map params, MyRoute router);

class BodyPage extends Page {
  BodyPage();
  BuildFn _buildFn;
  Map params;
  bool noAnimate = true;

  bottomNavigationBar(ctx, path, MyRoute router) {
    var _selectedIndex = -1;
    switch (path) {
      case Path.Home:
        _selectedIndex = 0;
        break;
      case Path.Subject:
        _selectedIndex = 1;
        break;
      case Path.User:
        _selectedIndex = 2;
        break;
      default:
    }
    if (_selectedIndex == 1) return null;
    const IconData home = Icons.home;
    const IconData gift = Icons.card_giftcard;
    const IconData contact = Icons.person;

    return BottomNavigationBar(
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(home), title: Text('首页')),
        BottomNavigationBarItem(icon: Icon(gift), title: Text('专题')),
        BottomNavigationBarItem(icon: Icon(contact), title: Text('用户')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.deepOrange,
      onTap: (index) {
        if (_selectedIndex == index) return;
        switch (index) {
          case 0:
            router.to(ctx, Path.Home, {});
            break;
          case 1:
            router.to(ctx, Path.Subject, {});
            break;
          case 2:
            router.to(ctx, Path.User, {});
            break;
          default:
        }
      },
    );
  }

  @override
  PageRoute build(Map params, MyRoute router) {
    if (noAnimate) {
      return PageRouteBuilder(
        pageBuilder: (BuildContext ctx, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Scaffold(
            body: _buildFn(ctx, params, router),
            bottomNavigationBar:
                bottomNavigationBar(ctx, params['path'] ?? '/', router),
          );
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext ctx) {
          return Scaffold(
            body: _buildFn(ctx, params, router),
            bottomNavigationBar:
                bottomNavigationBar(ctx, params['path'] ?? '/', router),
          );
        },
      );
    }
  }

  BodyPage.fromBuild(BuildFn build) {
    _buildFn = build;
  }
}
