class CatalogModel{
  static final items = [
  Item(
      id: 001,
      name: "Iphone 15 Pro",
      desc: "Iphone 15th generation.",
      price: 2000,
      color: "Natural Titanium",
      image:
          "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-15-pro-max-1.jpg")
];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    this.id = 001,
    this.name = '',
    this.desc = '',
    this.price = 1,
    this.color = '',
    this.image = ''});
}