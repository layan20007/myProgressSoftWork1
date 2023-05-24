import 'package:first_project/location.dart';
import 'package:first_project/pull_to_refresh.dart';
import 'package:first_project/qr_code_generator_and_scanner.dart';
import 'package:first_project/sqlite.dart';
import 'package:first_project/video_start_screen.dart';
import 'package:flutter/material.dart';
import 'Shared_preferences.dart';
import 'apis_and_json.dart';
import 'camera.dart';
import 'getx_test.dart';
import 'google_maps.dart';
import 'local_storage.dart';
import 'localization_home_page.dart';
import 'localization_page.dart';

class animation extends StatefulWidget {
  const animation({super.key});

  @override
  State<animation> createState() => _animationState();
}
class _animationState extends State<animation> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("animations and theming"),
      ),

      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              ElevatedButton(
                child: Text('change width'),
                onPressed: () {
                  setState(() {
                    _width = 400;
                  });
                },
              ),
              ElevatedButton(
                child: Text('change color'),
                onPressed: () {
                  setState(() {
                    _color = Colors.pink;
                  });
                },
              ),
              AnimatedOpacity(
                opacity: _opacity, duration: Duration(seconds: 2),
                child: Text('hide me',
                  style: TextStyle(color: Colors.white),),
              ),
              ElevatedButton(
                child: Text('HIDE'),
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
              ),
              ElevatedButton(
                child: Text('next'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const anotherPage();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('pull to refresh'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const pullToRefresh();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('shared Preferences'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const sharedPreferences();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('camera'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const camera();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('QR code'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const qrCode();
                      }));
                },
              ),
              ElevatedButton(onPressed: () {

                Navigator.push( context,
                    MaterialPageRoute(builder: (context) {
                      return const Maps();
                    }));
              }, child: Text('Map'),
              ),
              ElevatedButton(
                child: Text('location'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const Location();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('SQlite'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return ListScreen();
                      }));
                },
              ),

              ElevatedButton(
                child: Text('video'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return StartScreen();
                      }));
                },
              ),

              ElevatedButton(
                child: Text('getx'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return GetxRadioButton();
                      }));
                },
              ),
              ElevatedButton(
                child: Text('localization'),
                onPressed: () {
                  setState(() {

                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return MyApp();
                      }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }}