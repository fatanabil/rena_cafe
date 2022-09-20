import "dart:convert";

class MenuData {
  String foods = jsonEncode([
    {
      "name": "Pisang Goreng",
      "price": 7000,
      "res": "assets/img/foods/food-1.jpg",
      "qty": 0,
    },
    {
      "name": "Roti Bakar",
      "price": 10000,
      "res": "assets/img/foods/food-2.jpg",
      "qty": 0,
    },
    {
      "name": "Siomay",
      "price": 10000,
      "res": "assets/img/foods/food-3.jpg",
      "qty": 0,
    },
    {
      "name": "Omelet Mie",
      "price": 8000,
      "res": "assets/img/foods/food-4.jpg",
      "qty": 0,
    },
    {
      "name": "Spaghetti",
      "price": 15000,
      "res": "assets/img/foods/food-5.jpg",
      "qty": 0,
    },
    {
      "name": "Banana Pancake",
      "price": 15000,
      "res": "assets/img/foods/food-6.jpg",
      "qty": 0,
    },
    {
      "name": "Pudding",
      "price": 7000,
      "res": "assets/img/foods/food-7.jpg",
      "qty": 0,
    }
  ]);

  String drinks = jsonEncode([
    {
      "name": "Tea",
      "price": 7000,
      "res": "assets/img/drinks/drink-1.jpg",
      "qty": 0,
    },
    {
      "name": "Milkshake",
      "price": 10000,
      "res": "assets/img/drinks/drink-2.jpg",
      "qty": 0,
    },
    {
      "name": "Latte",
      "price": 15000,
      "res": "assets/img/drinks/drink-3.jpg",
      "qty": 0,
    },
    {
      "name": "Cappuccino",
      "price": 15000,
      "res": "assets/img/drinks/drink-4.jpg",
      "qty": 0,
    },
    {
      "name": "Espresso",
      "price": 15000,
      "res": "assets/img/drinks/drink-5.jpg",
      "qty": 0,
    },
    {
      "name": "Juice",
      "price": 7000,
      "res": "assets/img/drinks/drink-6.jpg",
      "qty": 0,
    },
    {
      "name": "Milk Tea",
      "price": 8000,
      "res": "assets/img/drinks/drink-7.jpg",
      "qty": 0,
    },
    {
      "name": "Hot Chocolate",
      "price": 10000,
      "res": "assets/img/drinks/drink-8.jpg",
      "qty": 0,
    },
  ]);

  String order = jsonEncode([
    {
      "name": "Pisang Goreng",
      "price": 7000,
      "res": "assets/img/foods/food-1.jpg",
      "qty": 3,
    },
    {
      "name": "Roti Bakar",
      "price": 10000,
      "res": "assets/img/foods/food-2.jpg",
      "qty": 2,
    },
    {
      "name": "Spaghetti",
      "price": 15000,
      "res": "assets/img/foods/food-5.jpg",
      "qty": 2,
    },
    {
      "name": "Milk Tea",
      "price": 8000,
      "res": "assets/img/drinks/drink-7.jpg",
      "qty": 3,
    },
    {
      "name": "Cappuccino",
      "price": 15000,
      "res": "assets/img/drinks/drink-4.jpg",
      "qty": 2,
    },
    {
      "name": "Milkshake",
      "price": 10000,
      "res": "assets/img/drinks/drink-2.jpg",
      "qty": 2,
    },
  ]);
}
