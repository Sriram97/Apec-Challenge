import 'package:apec_app/model/food.dart';

class Menu {
  static List<Food> menu = [
    Food(
        id: "1",
        image: "assets/images/menu1.png",
        name: "KARKAR",
        price: "\$12"),
    Food(
        id: "3",
        image: "assets/images/menu2.png",
        name: "SEPIK",
        price: "\$4"),
    Food(
        id: "4",
        image: "assets/images/menu3.png",
        name: "WOSERA",
        price: "\$30"),
    Food(
        id: "5",
        image: "assets/images/menu4.png",
        name: "KARKAR",
        price: "\$22"),
    Food(
        id: "2",
        image: "assets/images/menu5.png",
        name: "TELOFOMIN",
        price: "\$8"),
    Food(
        id: "6",
        image: "assets/images/menu6.png",
        name: "TULIP",
        price: "\$19"),
    Food(
        id: "7",
        image: "assets/images/menu2.png",
        name: "SALMON SALAD",
        price: "\$25"),
    Food(
        id: "8",
        image: "assets/images/menu5.png",
        name: "TELOFOMIN",
        price: "\$7"),
    Food(
        id: "9",
        image: "assets/images/menu2.png",
        name: "KANINIMBIT",
        price: "\$63"),
    Food(
        id: "10",
        image: "assets/images/menu1.png",
        name: "WOSERA",
        price: "\$43"),
  ];

  static Food getFoodById(id) {
    return menu.where((p) => p.id == id).first;
  }
}
