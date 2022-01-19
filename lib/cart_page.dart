import 'package:flutter/material.dart';
import 'package:rena_cafe/cart_payment_page.dart';
import 'package:rena_cafe/data/menu_data.dart';
import '../my_theme.dart';
import 'menu_page.dart';
import 'profile_page.dart';
import 'components/menu_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var items = MenuData().order;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 72),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg-img.png'),
            fit: BoxFit.cover,
            alignment: Alignment(-1.0, -1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'CART',
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
                    padding: EdgeInsets.only(bottom: 64),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        key: Key(items[index].toString()),
                        padding: EdgeInsets.zero,
                        child: MenuCard(
                          menuName: items[index]['name'].toString(),
                          menuCost: items[index]['price'].hashCode,
                          menuImg: items[index]['res'].toString(),
                          index: index,
                          qty: items[index]['qty'].hashCode,
                          type: 'order',
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _navigateToNextScreen(
              context,
              CartPaymentPage(
                items: items,
              ));
        },
        icon: Icon(Icons.payment_rounded),
        label: Text(
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
