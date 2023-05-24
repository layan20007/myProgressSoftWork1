import 'package:flutter/material.dart';
import 'check_list.dart';
import 'drawer.dart';

class pageView extends StatefulWidget {
  const pageView({Key? key}) : super(key: key);

  @override
  State<pageView> createState() => _pageViewState();
}
class _pageViewState extends State<pageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                height: 200,
                width: 400,
                child: PageView(
                  children:[
                    Text('page1',style: (TextStyle(fontSize: 30)),),
                    Text('page2',style: (TextStyle(fontSize: 30))),
                  ],
                ),
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