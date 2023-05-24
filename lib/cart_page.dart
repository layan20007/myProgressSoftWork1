import 'package:first_project/radio_button_payment_page.dart';
import 'package:flutter/material.dart';
import 'check_list.dart';
import 'list_view.dart';

class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}
class _cartPageState extends State<cartPage> {
  double total=0;
  @override
  void initState() {
    total = 0;
    for (var item in Const.cartItems) {
      total += item.price;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [


              ListView.builder(
                itemCount: Const.cartItems.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return _tile(Const.cartItems[index]);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Const.cartItems.clear();
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const checklist();
                        }));
                  },
                  child: Text('Extra')),
              Text('Total ='+total.toString()
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

            ]),
      ),
    );
  }
  ListTile _tile(Item item) {
    return ListTile(
      title: Text(item.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text("${item.price} JD"),
      leading: Icon(
        item.icon,

        color: Colors.blue[500],
      ),
      trailing: TextButton(
        onPressed: () {
          setState(() {
            total = 0;
            Const.cartItems.remove(item);
            for (var item in Const.cartItems) {
              total += item.price;
            }
          });
        },
        child: Icon(Icons.remove),

      ),




    );
  }
}