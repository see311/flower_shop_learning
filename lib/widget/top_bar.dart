import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String ShopCartIcon = "assets/svg/gouwuche.svg";
const String UserIcon = "assets/svg/wode.svg";
const String SearchIcon = "assets/svg/search.svg";

class TopBar extends StatelessWidget {
  VoidCallback toShopCart;
  VoidCallback toUser;
  VoidCallback toSearch;

  TopBar(this.toShopCart, this.toUser, this.toSearch);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: toShopCart,
              iconSize: 26,
              padding: EdgeInsets.all(0),
            ),
            SearchBar(),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: toUser,
              iconSize: 30,
              padding: EdgeInsets.all(0),
            ),
          ],
        ),
      ),
    );
  }

  Widget SearchBar() {
    return Expanded(
      child: GestureDetector(
        onTap: toSearch,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(SearchIcon, width: 24),
                Text('搜索'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
