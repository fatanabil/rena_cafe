import 'dart:async';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rena_cafe/cart_page.dart';
import 'package:rena_cafe/data/menu_data.dart';
import 'components/menu_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var foods = MenuData().foods;
  var qty = 0;

  void _addItem(int index) {
    setState(() {
      foods[index]['qty'] = foods[index]['qty'].hashCode + 1;
      qty++;
    });
  }

  void _delItem(int index) {
    setState(() {
      if (foods[index]['qty'].hashCode > 0) {
        foods[index]['qty'] = foods[index]['qty'].hashCode - 1;
        qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 56),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-img.png'),
            fit: BoxFit.fitHeight,
            alignment: Alignment(-1.0, -1.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'FOODS',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 100),
                    itemCount: foods.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: EdgeInsets.zero,
                        key: Key(foods[index].toString()),
                        child: MenuCard(
                          menuName: foods[index]['name'].toString(),
                          menuCost: foods[index]['price'].hashCode,
                          menuImg: foods[index]['res'].toString(),
                          qty: foods[index]['qty'].hashCode,
                          index: index,
                          type: 'foods',
                          addItem: () {
                            setState(() {
                              _addItem(index);
                            });
                          },
                          delItem: () {
                            setState(() {
                              _delItem(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
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
            alignment: Alignment(1.6, -2),
            children: [
              FloatingActionButton(
                onPressed: () {
                  _navigateToNextScreen(context, CartPage());
                },
                child: Icon(Icons.shopping_cart_rounded),
              ),
              // Container(
              //   child: Center(
              //     child: Text('${qty}'),
              //   ),
              //   padding: EdgeInsets.all(2),
              //   width: 32,
              //   height: 32,
              //   decoration: BoxDecoration(
              //     color: Colors.amber,
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              // )
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
