import 'package:flower_shop/layout/body_with_scaffold.dart';
import 'package:flower_shop/router.dart';
import 'package:flower_shop/widget/card_box.dart';
import 'package:flower_shop/widget/my_title.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flower_shop/path.dart' as Path;

var UserPage = () => BodyPage.fromBuild((ctx, params, router) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              myTitle('个人中心'),
              userAvatar(),
              SizedBox(height: 10),
              selectItem(ctx, "购物车", "/shopCart", router),
              selectItem(ctx, "优惠券", "/coupon", router),
              selectItem(ctx, "修改密码", "/change_pass", router),
              Divider(),
              selectItem(ctx, "退出", "/exit", router),
            ],
          ),
        ),
      );
    });

Widget userAvatar() {
  return CardBox(
    height: 120,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 10),
        Container(
          width: 80,
          height: 80,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://avatars1.githubusercontent.com/u/22143374?s=460&v=4',
                fit: BoxFit.cover,
                height: 130,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("用户昵称", textScaleFactor: 1.2),
                Text("用户简介，用户简介，用户简介，用户简介，用户简介，用户简介，用户简介，用户简介，用户简介，用户简介，用户简介",
                    textScaleFactor: .9,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget selectItem(BuildContext ctx, String text, String path, MyRoute router) {
  return ListTile(
    onTap: () {
      router.to(ctx, path, {});
    },
    title: Text(text),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 16,
    ),
  );
}
