import 'package:flower_shop/model/category.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flower_shop/widget/card_box.dart';

typedef void CategoryClick(num index);

class CategoryList extends StatelessWidget {
  final List<Category> categorys;
  final CategoryClick handler;

  CategoryList(this.categorys, {this.handler});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(left: 10),
      child: ScrollConfiguration(
        // 另一种去除滚动到头效果的方法
        behavior: MyBehavior(),
        child: ListView.builder(
          itemCount: categorys.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            var cate = categorys[index];
            return GestureDetector(
                onTap: () {
                  if (this.handler != null) this.handler(index);
                },
                child: CardBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: cate.imgUrl,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(top: 10),
                        child: Text(cate.name, textScaleFactor: 1.2),
                      )
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
