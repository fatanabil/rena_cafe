import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rena_cafe/cart_page.dart';
import 'package:rena_cafe/data/menu_data.dart';
import 'package:rena_cafe/data/menu_key.dart';

import 'components/menu_card.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({Key? key}) : super(key: key);

  @override
  _DrinkPageState createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  var key = MenuKey().drinks;
  var drinks = jsonDecode(MenuData().drinks);
  var qty = 0;

  void _addItem(int index) {
    setState(() {
      int foodQty = drinks[index]['qty'];
      drinks[index]['qty'] = foodQty + 1;
      if (foodQty == 0) {
        qty = qty + 1;
      }
    });
  }

  void _delItem(int index) {
    setState(() {
      int foodQty = drinks[index]['qty'];
      if (foodQty > 0) {
        drinks[index]['qty'] = foodQty - 1;
        if (foodQty - 1 == 0) {
          qty = qty - 1;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
                'DRINKS',
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
                child: Container(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: drinks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.zero,
                          key: Key(drinks[index].toString()),
                          child: MenuCard(
                            key: key[index],
                            menuName: drinks[index]['name'].toString(),
                            menuCost: drinks[index]['price'].hashCode,
                            menuImg: drinks[index]['res'].toString(),
                            index: index,
                            type: 'drinks',
                            qty: drinks[index]['qty'],
                            addItem: _addItem,
                            delItem: _delItem,
                          ),
                        );
                      }),
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
                  child: Text('${qty}'),
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
