import 'package:first_project/pages_of_tabs.dart';
import 'package:flutter/material.dart';
import 'list_of_tabs.dart';


class tabBar extends StatefulWidget {
  const tabBar({Key? key}) : super(key: key);

  @override
  State<tabBar> createState() => _tabBarState();
}
class _tabBarState extends State<tabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length:list.length ,
        child: Scaffold(
      appBar: AppBar(
        title: Text('tab bar'),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        bottom: TabBar(
            tabs : list.map<Widget>((listOfTabs tabsOfList){
              return Tab(
                icon: Icon(tabsOfList.icon),
                text: tabsOfList.title,
              );
            }).toList()
        ),
      ),
      body:TabBarView(children: list.map<Widget>((listOfTabs tabsOfList){
        return Padding(padding:EdgeInsets.all(20),
          child: pagesOfTabs(
              tabsList:tabsOfList),
        ) ;
      }).toList()

        ,),
    )
    );
  } }