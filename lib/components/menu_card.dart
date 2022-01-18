import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rena_cafe/data/menu_data.dart';

class MenuCard extends StatefulWidget {
  final String menuName;
  final int menuCost;
  final String menuImg;
  final VoidCallback addItem;
  final VoidCallback delItem;
  final String type;
  final int index;
  int qty = 0;

  MenuCard({
    this.menuName = '',
    this.menuCost = 0,
    this.menuImg = '',
    this.qty = 0,
    this.type = '',
    this.index = 0,
    required this.addItem,
    required this.delItem,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  var numberFormat =
      NumberFormat.currency(locale: "id_ID", customPattern: "#,###");

  var menuData;
  var qty = 0;

  @override
  void initState() {
    super.initState();

    if (widget.type == 'foods') {
      menuData = MenuData().foods[widget.index];
      qty = menuData['qty'];
    } else if (widget.type == 'drinks') {
      menuData = MenuData().drinks[widget.index];
      qty = menuData['qty'];
    } else if (widget.type == 'order') {
      menuData = MenuData().order[widget.index];
      qty = menuData['qty'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        width: 350,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(
                      this.widget.menuImg != ''
                          ? this.widget.menuImg
                          : 'assets/img/default.jpg',
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  this.widget.menuName,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Rp. ${numberFormat.format(this.widget.menuCost)}',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 48,
                  child: TextButton(
                    onPressed: (){
                      if(qty > 0) {
                        setState(() {
                          qty--;
                        });
                      }
                      widget.delItem;
                      },
                    child: Text('-'),
                  ),
                ),
                Text('${qty}'),
                SizedBox(
                  width: 48,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                        widget.addItem;
                      });
                      },
                    child: Text('+'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
