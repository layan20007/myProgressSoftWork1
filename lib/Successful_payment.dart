
import 'package:first_project/slider_page.dart';
import 'package:first_project/tab_bar.dart';
import 'package:flutter/material.dart';

class lastPage extends StatefulWidget {
  const lastPage({Key? key}) : super(key: key);

  @override
  State<lastPage> createState() => _lastPageState();
}
class _lastPageState extends State<lastPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Builder(builder: (context){

        return Scaffold(
          appBar: AppBar(
            // title: Text(''),
            backgroundColor: Colors.blue[200],


          ),

          body:
          SafeArea(

            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment:  MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(50, 50, 50, 5),
                  height: 250,
                  width: 350,
                  child: Image.network('https://previews.123rf.com/images/mopc95/mopc951708/mopc95170800002/83868364-vector-illustration-of-flat-bold-line-credit-cards-icon-graphic-design-concept-of-successful-pay-or.jpg',

                    height: 250,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  height: 100,
                  width: 400,
                  child:Text(' Payment Done Successfully',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,
                        fontFamily: 'DeliciousHandrawn'
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50,bottom: 50),
                  child: ElevatedButton(

                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const tabBar();
                            }));
                      },
                      child: Text('time to deliver')
                  ),
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const sliderPage();
                          }));
                    },
                    child: Text('Ok')
                ),
              ],
            ),
          ),
        );
      }
      ),
    );
  }
}