import 'package:flutter/material.dart';
import 'Successful_payment.dart';
import 'check_list.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({Key? key}) : super(key: key);
  @override
  State<paymentPage> createState() => _paymentPageState();
}
class _paymentPageState extends State<paymentPage> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context){
        return Scaffold(
          appBar: AppBar(
            title: Text('Payment') ,
            backgroundColor: Colors.lightBlue[300],
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(value: 1, groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    Icon(Icons.add_card_rounded),
                    SizedBox(width: 10,),
                    Text('Credit Card'),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 2, groupValue: _value,
                      onChanged: (value){
                        setState(() {
                          _value = value!;
                        });
                      },
                    ),
                    Icon(Icons.money_rounded),
                    SizedBox(width: 10,),
                    Text('Cash'),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Const.cartItems.clear();
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const lastPage();
                          }));
                    },
                    child: Text('Pay')),

              ],
            ),
          ),
        );
      }
      ),
    );
  }
}