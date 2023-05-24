import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_of_tabs.dart';

class pagesOfTabs extends StatelessWidget {

  final listOfTabs tabsList;
  const pagesOfTabs({Key? key, required this.tabsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(tabsList.icon,
            size: 150,),
          SizedBox(
            height: 20,
          ),
          Text(tabsList.title),

        ],
      ),

    );
  }
}