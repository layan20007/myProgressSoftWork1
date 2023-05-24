import 'package:flutter/material.dart';
import 'check_list.dart';
import 'drawer.dart';

class sliderPage extends StatefulWidget {
  const sliderPage({Key? key}) : super(key: key);

  @override
  State<sliderPage> createState() => _sliderPageState();
}
class _sliderPageState extends State<sliderPage> {
  double min =0;
  double max = 10;
  double val=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Column(
        children: [
          Center(
            child:SliderTheme(
              data:SliderThemeData(
                trackHeight: 10,
                thumbColor: Colors.teal[300],),
              child: Slider(
                  value: val ,
                  min:this.min,
                  max: this.max,
                  label:val.abs().toString(),
                  divisions:10,
                  onChanged: (value){
                    setState(() {
                      val=value;
                    });
                  }),
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
    );
  }
}