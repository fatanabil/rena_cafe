import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rena_cafe/cart_payment_page.dart';
import 'package:rena_cafe/data/menu_data.dart';
import 'components/menu_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var items = jsonDecode(MenuData().order);

  @override
  void initState() {
    super.initState();
  }

  void _addItem(int index) {}
  void _delItem(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 72),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-img.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-1.0, -1.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text(
                'CART',
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
                  padding: const EdgeInsets.only(bottom: 64),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      key: Key(items[index].toString()),
                      padding: EdgeInsets.zero,
                      child: MenuCard(
                        key: GlobalKey(),
                        menuName: items[index]['name'].toString(),
                        menuCost: items[index]['price'].hashCode,
                        menuImg: items[index]['res'].toString(),
                        index: index,
                        qty: items[index]['qty'],
                        type: 'order',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _navigateToNextScreen(
              context,
              CartPaymentPage(
                items: items,
              ));
        },
        icon: const Icon(Icons.payment_rounded),
        label: const Text(
          'Pay',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}
