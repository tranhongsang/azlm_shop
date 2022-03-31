class CakeModel {
  String? pathImage;
  String nameShop;
  String nameCake;
  String current;
  String price;

  CakeModel(
      {required this.nameShop,
      required this.nameCake,
      this.current = '¥',
      required this.price,
      this.pathImage});
}
