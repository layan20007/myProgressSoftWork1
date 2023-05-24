import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class secureStorage  extends StatefulWidget {
  const secureStorage ({Key? key}) : super(key: key);

  @override
  State<secureStorage > createState() => _secureStoragState();
}



class _secureStoragState extends State<secureStorage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secure Storage'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text('secure\nstorage',
            ),
            const SizedBox(height: 32,),
            buildName(),
            const SizedBox(height: 12,),
            buildBirthday(),
            const SizedBox(height: 12,),
            buildPets(),
            const SizedBox(height: 32,),
            buildButton(),

          ],
        ),
      ),



    );
  }

  buildName() {}

  buildBirthday() {}

  buildPets() {}

  buildButton() {}
}


