import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuCard extends StatefulWidget {
  final String menuName;
  final int menuCost;
  final String menuImg;
  final String type;
  final int index;
  final Function(int) addItem;
  final Function(int) delItem;
  int qty;

  MenuCard({
    GlobalKey? key,
    this.menuName = '',
    this.menuCost = 0,
    this.menuImg = '',
    this.qty = 0,
    this.type = '',
    this.index = 0,
    required this.addItem,
    required this.delItem,
  }) : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  var numberFormat =
      NumberFormat.currency(locale: "id_ID", customPattern: "#,###");

  var qty = 0;

  @override
  void initState() {
    super.initState();
    qty = widget.qty;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
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
                      widget.menuImg != ''
                          ? widget.menuImg
                          : 'assets/img/default.jpg',
                    ),
                    fit: BoxFit.fitWidth),
              ),
              child: const AspectRatio(
                aspectRatio: 1 / 1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.menuName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Rp. ${numberFormat.format(widget.menuCost)}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.black45, fontSize: 14),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 48,
                  child: TextButton(
                    onPressed: () {
                      widget.delItem(widget.index);
                      if (qty > 0) {
                        setState(() {
                          qty = qty - 1;
                        });
                      }
                    },
                    child: const Text('-'),
                  ),
                ),
                Text('$qty'),
                SizedBox(
                  width: 48,
                  child: TextButton(
                    onPressed: () {
                      widget.addItem(widget.index);
                      setState(() {
                        qty = qty + 1;
                      });
                    },
                    child: const Text('+'),
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
