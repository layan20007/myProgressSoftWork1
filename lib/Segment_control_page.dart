import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentControlPage extends StatefulWidget {
  const SegmentControlPage({Key? key}) : super(key: key);

  @override
  State<SegmentControlPage> createState() => _SegmentControlPageState();
}
class _SegmentControlPageState extends State<SegmentControlPage> {
  int groupValue=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Segment Control\nAppetizers'),
        backgroundColor: Colors.blue[200],
      ) ,
      body: ListView(
        children: [
          CupertinoSegmentedControl<int>(
              padding: EdgeInsets.all(20),
              groupValue: groupValue,
              selectedColor: Colors.purple[200],
              borderColor: Colors.purple[300],

              children: {
                0:buildSegment('salad'),
                1:buildSegment('soup'),
              },
              onValueChanged: (groupValue){
                print(groupValue);

                setState(() {
                  this.groupValue=groupValue;
                });
              }
          )

        ],
      ),
    );
  }

  Widget buildSegment(String text) =>Container(
    padding: EdgeInsets.all(12),
    child: Text(
      text,
      style: TextStyle(fontSize: 20),
    ),
  ) ;
}