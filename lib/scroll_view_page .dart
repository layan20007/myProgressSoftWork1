import 'package:flutter/material.dart';
import 'check_list.dart';
import 'drawer.dart';

class scrollViewPage extends StatefulWidget {
  const scrollViewPage({Key? key}) : super(key: key);

  @override
  State<scrollViewPage> createState() => _scrollViewPageState();
}
class _scrollViewPageState extends State<scrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[50],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[100],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[200],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[300],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[400],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[500],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[600],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[700],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[800],
                  width:  200,
                  height: 200,
                ),
                Container(
                  margin: EdgeInsets.all(50),
                  color:Colors.teal[900],
                  width:  200,
                  height: 200,
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

              ],),
          ),
        ),
      ),
    );
  }
}
