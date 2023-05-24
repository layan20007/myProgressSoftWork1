import 'package:flutter/material.dart';
import 'check_list.dart';
import 'drawer.dart';

class gifPage extends StatefulWidget {
  const gifPage({Key? key}) : super(key: key);

  @override
  State<gifPage> createState() => _gifPageState();
}
class _gifPageState extends State<gifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,
                width: 100,
                child:  Image.network('https://i.stack.imgur.com/vXYLh.gif'),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Const.cartItems.clear();
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const mainApp();
                        }));
                  },
                  child: Text('ok')),

            ],
          ),
        ),
      ),
    );
  }
}
