import 'package:flower_shop/model/goods.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flower_shop/router.dart';
import 'package:flower_shop/path.dart' as Path;

class GoodBox extends StatelessWidget {
  final String name;
  final String imgUrl;
  final VoidCallback routerCallback;
  GoodBox(this.name, this.imgUrl, {this.routerCallback});
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: routerCallback,
      child: Container(
        width: screenWidth / 2 - 20,
        child: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: this.imgUrl,
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(this.name),
            )
          ],
        ),
      ),
    );
  }
}

class GoodsList extends StatelessWidget {
  final List<Goods> goods;
  GoodsList(this.goods);

  List<Widget> list(BuildContext ctx) {
    return List.generate(goods.length, (i) {
      var item = goods[i];
      return GoodBox(item.name, item.imgUrl, routerCallback: () {
        route.to(ctx, Path.Detail, {"name": item.name});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          runSpacing: 10.0,
          children: list(context),
        ),
      ),
    );
  }
}
