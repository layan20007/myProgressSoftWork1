import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'google_maps.dart';

class listOfTabs {
  final String title;
  final IconData icon;

  listOfTabs({required this.title,required this.icon});
}

List <listOfTabs> list = <listOfTabs> [

  listOfTabs(
    title: 'time',

    icon: Icons.access_time_filled,


  ),

  listOfTabs(

      title: 'map',

      icon: Icons.directions ,


  ),

];