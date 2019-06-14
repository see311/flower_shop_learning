import 'package:flower_shop/layout/body_with_scaffold.dart';
import 'package:flower_shop/widget/card_box.dart';
import 'package:flower_shop/widget/my_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var couponPage = () => BodyPage.fromBuild((ctx, params, router) {
      return SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // IOSNavBar(ctx),
                    myTitle("购物券"),
                    _coupon("五一购物券", 99, "2019-11-1", "满 500 可用"),
                    _coupon("圣诞礼券", 109, "2019-11-1", "无限制")
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });

Widget _coupon(String title, num price, String timeEnd, String desc) {
  return CardBox(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    textScaleFactor: 1.4,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text(desc, textScaleFactor: 1.1),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: <Widget>[
                Expanded(child: Text(timeEnd, textScaleFactor: 0.9)),
                SizedBox(
                  child: Text(
                    "￥ ${price.toString()}",
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
