
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class pullToRefresh extends StatefulWidget {
  const pullToRefresh({Key? key}) : super(key: key);

  @override
  State<pullToRefresh> createState() => _pullToRefreshState();
}
Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 2));
}
class _pullToRefreshState extends State<pullToRefresh> {

  late List dummyList;
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;
  @override
  void initState(){
    super.initState();
    dummyList =List.generate(10, (index) => "item : ${index+1}");
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getMoreList();
      }
    });
  }
  _getMoreList(){
    print('get more list');
    for(int i =_currentMax ; i<_currentMax+10 ;i++){
      dummyList.add("Item : ${i+1}");
    }
    _currentMax=_currentMax+10;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull to refresh'),
      ),
      body: Container(
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.builder(
            controller: _scrollController,
            itemExtent: 80,
            itemCount: dummyList.length+1,
            itemBuilder: (context , index){
              if(index == dummyList.length){
                return CupertinoActivityIndicator();
              }
              return ListTile(
                title: Text(dummyList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

