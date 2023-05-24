import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'check_list.dart';
import 'custom_search_delegate.dart';


class Item {
  String name;
  double price;
  IconData icon;
  int id;


  Item(this.name, this.price, this.icon, this.id);


}
class thirdPage extends StatefulWidget {
  const thirdPage({Key? key}) : super(key: key);

  @override
  State<thirdPage> createState() => _thirdPageState();
}
List<Item> items = [
  Item('Chicken Burger', 5 , Icons.fastfood_rounded, 1),
  Item('Beef Burger', 6 , Icons.fastfood_rounded ,  2 ),
  Item('HotDog',3 , Icons.fastfood_rounded , 3),
  Item('Alfredo Pizza', 5 , Icons.local_pizza_rounded,4),
  Item('Veggie Pizza', 4 , Icons.local_pizza_rounded,5),
  Item('Spaghetti Pesto', 5 , Icons.restaurant_rounded,6),
  Item('Seafood Spaghetti',  7 , Icons.restaurant_rounded,7),
  Item('Grilled Chicken ', 5 , Icons.restaurant,8),
  Item('Grilled Steak ', 7 , Icons.restaurant,9),
  Item('Grilled Salmon ', 8 , Icons.restaurant_rounded,10),
  Item('Sushi 16 pcs', 15 , Icons.restaurant_rounded,11),
  Item('Fried Seafood Platter ', 10 , Icons.restaurant,12),
];
class _thirdPageState extends State<thirdPage> {
  int sum = 0;


  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Scaffold(
      appBar: AppBar(

        title: Text('Main Course'),
        actions:[
          IconButton(
            onPressed: () {
              showSearch(context: context,
                delegate: customSearchDelegate(),);
            },
            icon: Icon(
              Icons.search,),

          ),


          //  TextField(
          //  decoration: InputDecoration(
          //  border: OutlineInputBorder(),
          //hintText: 'Enter a search term',
          //),
          //),

          IconButton(
            icon: Icon(
              Icons.shopping_basket_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const cartPage();
              }));
            },
          )
        ],
        backgroundColor: Colors.blue[200],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return _tile(items[index]);
                  },
                ),
              ),
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
        ),
      ),
      subtitle: Text(item.price.toString()+ " JD"),
      leading: Icon(
        item.icon,

        color: Colors.blue[500],
      ),
      trailing: TextButton(
        onPressed: () {
          setState(() {
            Const.cartItems.add(item);
          });
        },
        child: Text('add'),
      ),
    );
  }


}