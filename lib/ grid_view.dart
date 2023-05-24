import 'package:flutter/material.dart';
import 'Segment_control_page.dart';
import 'list_view.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key, required String title});

  @override
  State<secondPage> createState() => secondPageState();
}
class secondPageState extends State<secondPage> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
        backgroundColor: Colors.blue[200],

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/128/7443/7443733.png',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const thirdPage();
                              }));
                        },
                        child: Text('main course'),
                      ),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1721/1721500.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const SegmentControlPage();
                            }));
                      },
                      child: Text('Appetizers'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/4421/4421199.png',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const secondPage(title: 'SecondPage');
                            }));
                      },
                      child: Text('Dessert'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3126/3126588.png',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return const secondPage(title: 'SecondPage');
                            }));
                      },
                      child: Text('Drinks'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
