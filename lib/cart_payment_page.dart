import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rena_cafe/my_theme.dart';
import 'package:rena_cafe/payment_success_page.dart';

class CartPaymentPage extends StatefulWidget {
  final items;
  int total = 0;

  CartPaymentPage({Key? key, required this.items}) : super(key: key);

  @override
  _CartPaymentPageState createState() => _CartPaymentPageState();
}

class _CartPaymentPageState extends State<CartPaymentPage> {
  var numberFormat =
      NumberFormat.currency(locale: "id_ID", customPattern: "#,###");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < widget.items.length; i++) {
      widget.total +=
          widget.items[i]['price'].hashCode * widget.items[i]['qty'].hashCode;
    }
  }

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
                'PAYMENT',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                elevation: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  width: 350,
                  child: Column(
                    children: [
                      const Text(
                        'DETAIL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: priBlue,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Table(
                        border:
                            TableBorder.all(width: 1, style: BorderStyle.none),
                        columnWidths: const {
                          0: FlexColumnWidth(),
                          1: FixedColumnWidth(50),
                          2: FixedColumnWidth(110),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          for (var item in widget.items)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    '${item['name']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                                Text(
                                  '${item['qty']}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Rp. ${numberFormat.format(item['price'] * item['qty'])}',
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Table(
                        border:
                            TableBorder.all(width: 1, style: BorderStyle.none),
                        columnWidths: const {
                          0: FlexColumnWidth(),
                          1: FixedColumnWidth(50),
                          2: FixedColumnWidth(100),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              const Text(''),
                              const Text(
                                'TOTAL',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Rp. ${numberFormat.format(widget.total)}',
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pushReplacemnet(context, const PaymentSuccessPage());
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 10,
                          ),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _pushReplacemnet(BuildContext context, Widget widget) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => widget));
}
