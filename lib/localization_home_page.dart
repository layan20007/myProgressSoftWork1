import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _appLocale = AppLocalizations.supportedLocales[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _appLocale = const Locale('en');
                        });

                      },
                      child: Text('EN')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _appLocale = const Locale('es');
                        });
                      },
                      child: Text('ES')),
                ]),
            Localizations.override(
              context: context,
              locale: _appLocale,
              child: Builder(builder: (context) {
                return Text(AppLocalizations.of(context).helloWorld);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
