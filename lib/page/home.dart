import 'package:flower_shop/layout/body_with_scaffold.dart';
import 'package:flower_shop/test_db/db.dart';
import 'package:flower_shop/widget/category_list.dart';
import 'package:flower_shop/widget/goods_list.dart';
import 'package:flower_shop/widget/top_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/path.dart' as Path;

var HomePage = () => BodyPage.fromBuild((ctx, params, router) {
      VoidCallback toShopCart = () => router.to(ctx, Path.ShopCart, {});
      VoidCallback toSearch = () => router.to(ctx, Path.Search, {});
      VoidCallback toUser = () => router.to(ctx, Path.User, {});

      return SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(toShopCart, toUser, toSearch),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  // 去掉滚动到头的时候的效果
                  overscroll.disallowGlow();
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '分类',
                        textScaleFactor: 1.2,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    ),
                    CategoryList(categorys,
                        handler: (i) => router.to(ctx, '/goods', {})),
                    Container(
                      child: Text(
                        '商品',
                        textScaleFactor: 1.2,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    ),
                    GoodsList(goods),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
