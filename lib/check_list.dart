import 'package:first_project/radio_button_payment_page.dart';
import 'package:flutter/material.dart';
import 'list_view.dart';

class checklist extends StatefulWidget {
  const checklist({Key? key}) : super(key: key);

  @override
  State<checklist> createState() => _checklistState();
}
class _checklistState extends State<checklist> {
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  bool item4 = false;
  bool item5 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: Text('Extra'),
              backgroundColor: Colors.lightBlue[300],
            ),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CheckboxListTile(value: item1,
                    onChanged: (val){
                      setState(() {
                        item1=val!;
                      });
                    },
                    activeColor:Colors.purple[200],
                    title: Text('item1'),

                  ),

                  CheckboxListTile(value: item2,
                    onChanged: (val){
                      setState(() {
                        item2=val!;
                      });
                    },
                    activeColor:Colors.purple[200],
                    title: Text('item2'),

                  ),

                  CheckboxListTile(value: item3,
                    onChanged: (val){
                      setState(() {
                        item3=val!;
                      });
                    },
                    activeColor:Colors.purple[200],
                    title: Text('item3'),

                  ),

                  CheckboxListTile(value: item4,
                    onChanged: (val){
                      setState(() {
                        item4=val!;
                      });
                    },
                    activeColor:Colors.purple[200],
                    title: Text('item4'),

                  ),

                  CheckboxListTile(value: item5,
                    onChanged: (val){
                      setState(() {
                        item5=val!;
                      });
                    },
                    activeColor:Colors.purple[200],
                    title: Text('item5'),

                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Const.cartItems.clear();
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const paymentPage();
                            }));
                      },
                      child: Text('done')),

                ],
              ),
            ),
          );

        }
        )
    );}
}

class Const{
  static List<Item> cartItems = [];
}