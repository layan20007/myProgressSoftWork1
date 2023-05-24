import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'check_list.dart';
import 'drawer.dart';

class switchPage extends StatefulWidget {
  const switchPage({Key? key}) : super(key: key);

  @override
  State<switchPage> createState() => _switchPageState();
}
class _switchPageState extends State<switchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,

            children:[
              Text('Notifications'),

              LiteRollingSwitch(
                value: true,
                textOn:"on",
                textOff:"off",
                colorOn:Colors.green,
                colorOff:Colors.red,
                iconOn:Icons.lightbulb_outline_rounded,
                iconOff:Icons.power_settings_new_rounded,
                onChanged: (bool  val) {  },
                onTap: (bool  val) {  },
                onDoubleTap: (bool  val) {  },
                onSwipe: (bool  val) {  },
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
                  child: Text('ok')
              ),

            ]),
      ),
    );
  }
}
