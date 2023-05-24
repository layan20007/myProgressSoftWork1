import 'package:first_project/audio_recording.dart';
import 'package:first_project/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_storage.dart';
class sharedPreferences extends StatefulWidget {
  const sharedPreferences({Key? key}) : super(key: key);

  @override
  State<sharedPreferences> createState() => _sharedPreferencesState();
}
class _sharedPreferencesState extends State<sharedPreferences> {
  String? value ;

  @override
  void initState(){
    super.initState();
    loadData();
  }
  void loadData() async{
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    setState(() {
      value = prefs.getString('TestString_Key');
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('save and load data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('data in shared preferences:',
            style: TextStyle(fontSize: 20),
            ),
            Text( value ?? 'no data',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 32),
            Divider(),
            SizedBox(height: 32,),
            ElevatedButton(
              child: Text('save data'),
              onPressed: () async {
                SharedPreferences prefs = await  SharedPreferences.getInstance();
                prefs.setString('TestString_Key', 'new value121212');
              },
            ),

            ElevatedButton(
              child: Text('load data'),
              onPressed: () async {
                SharedPreferences prefs = await  SharedPreferences.getInstance();
                print(prefs.getKeys());
                setState(() {
                  value = prefs.getString('TestString_Key');
                });
              },
            ),
            ElevatedButton(
              child: Text('clear data'),
              onPressed: () async {
                SharedPreferences prefs = await  SharedPreferences.getInstance();
                prefs.remove('TestString_Key');

              },
            ),
            ElevatedButton(
              child: Text('local storage'),
                onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return const localStorage();
                    }));
                },
            ),
            ElevatedButton(
              child: Text('secure Storage'),
              onPressed:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return const secureStorage();
                    }));
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return const audioRecording();
                  }));
            },
                child: Text("audio recorder"))

          ],),
      ),
    );
  }
}





