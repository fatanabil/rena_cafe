import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rena_cafe/cart_page.dart';
import 'package:rena_cafe/data/menu_data.dart';

import 'components/menu_card.dart';
import 'data/menu_key.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var key = MenuKey().foods;
  var foods = jsonDecode(MenuData().foods);
  var qty;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qty = 0;
  }

  void _addItem(int index) {
    setState(() {
      int foodQty = foods[index]['qty'];
      foods[index]['qty'] = foodQty + 1;
      if (foodQty == 0) {
        qty = qty + 1;
      }
    });
  }

  void _delItem(int index) {
    setState(() {
      int foodQty = foods[index]['qty'];
      if (foodQty > 0) {
        foods[index]['qty'] = foodQty - 1;
        if (foodQty - 1 == 0) {
          qty = qty - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 56),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-img.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-1.0, -1.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                'FOODS',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: foods.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: EdgeInsets.zero,
                      key: Key(foods[index].toString()),
                      child: MenuCard(
                        key: key[index]['foodKey$index'],
                        menuName: foods[index]['name'].toString(),
                        menuCost: foods[index]['price'].hashCode,
                        menuImg: foods[index]['res'].toString(),
                        qty: foods[index]['qty'].hashCode,
                        index: index,
                        type: 'foods',
                        addItem: _addItem,
                        delItem: _delItem,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FittedBox(
          child: Stack(
            alignment: const Alignment(1.6, -2),
            children: [
              FloatingActionButton(
                onPressed: () {
                  _navigateToNextScreen(context, const CartPage());
                },
                child: const Icon(Icons.shopping_cart_rounded),
              ),
              Container(
                child: Center(
                  child: Text('$qty'),
                ),
                padding: const EdgeInsets.all(2),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context, Widget widget) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));
}
