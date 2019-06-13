class Goods {
  String imgUrl;
  String name;
  String type;
  num price;
  int count;
  bool checked;

  Goods(
      {this.imgUrl,
      this.name,
      this.type,
      this.price,
      this.count,
      this.checked = false});
}
