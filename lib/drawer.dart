import 'package:first_project/page_view.dart';
import 'package:first_project/scroll_view_page%20.dart';
import 'package:first_project/switch_page.dart';
import 'package:flutter/material.dart';
import ' grid_view.dart';
import 'gif.dart';
import 'login_page.dart';

class mainApp extends StatefulWidget {
  const mainApp({
    super.key,
  });

  @override
  State<mainApp> createState() => _mainAppState();
}
class _mainAppState extends State<mainApp> {
  String message = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Food Station'),
            backgroundColor: Colors.blue[200],

          ),
          drawer: Drawer(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const pageView();
                            }));
                      },
                      child: Row(children: [
                        Icon(Icons.swipe_down),
                        Text('\t page view')],)
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const gifPage();
                            }));
                      },
                      child: Row(children: [
                        Icon(Icons.gif),
                        Text('\t Gif')],)
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const switchPage();
                            }));
                      },
                      child: Row(children: [

                        Icon(Icons.settings),
                        Text(' \t settings'),
                      ],)
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const scrollViewPage();
                            }));
                      },
                      child: Row(children: [

                        Icon(Icons.swipe_down_rounded),
                        Text(' \t scroll page'),
                      ],)
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const loginPage();
                            }));
                      },
                      child: Row(children: [
                        Icon(Icons.logout),
                        Text('\t log out')],)
                  ),

                ],
              ),
            ),
          ),

          body: SafeArea(
            child: Container(
              decoration:  BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.blueAccent,
                    Colors.deepPurpleAccent,
                  ],
                    begin: Alignment.topLeft,
                    end:Alignment.bottomRight,
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 50, 50, 5),
                    height: 250,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Image.network(
                      'https://family-images-y24bv7yxalct4.azureedge.net/families/6375/6375_homescreenlogo_1024x1024.webp',
                      height: 250,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const secondPage(title: 'SecondPage');
                            }));
                      },
                      child: Text('menu')
                  ),

                ],
              ),
            ),
          ),
        );

      }),
    );
  }
}