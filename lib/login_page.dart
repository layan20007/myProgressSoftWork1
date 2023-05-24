import 'package:first_project/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() {
    return  _loginPageState();
  }}
class _loginPageState extends State<loginPage> {

  final formKey = GlobalKey<FormState>();
  final usernameCont = TextEditingController();
  final passwordcont = TextEditingController();
  bool passToggle = true;

  @override
  void dipose(){
    super.dispose();
    usernameCont.dispose();
    passwordcont.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme:ThemeData.dark(),
      home: Builder(builder: (context){
        return Scaffold(
          appBar: AppBar(title: Text('Login'),
            backgroundColor: Colors.lightBlue[300],
          ),
          // backgroundColor: Colors.deepPurple[100],
          body: SafeArea(
            child:  Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey ,
                  child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children:[
                        Container(

                          margin: EdgeInsets.fromLTRB(50, 50, 50, 5),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),),

                          child: Image.network('https://cdn-icons-png.flaticon.com/512/6681/6681204.png',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,

                          ),

                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 50, 50, 5),

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: usernameCont,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Email',
                                        prefixIcon:Icon(Icons.email),
                                      ),
                                      validator: (value){
                                        bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

                                        if (value!.isEmpty){
                                          return "Enter an Email";
                                        }
                                        else if (!emailValid){
                                          return "Enter Valid Email";
                                        }
                                      }


                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                  child: TextFormField(
                                    controller: passwordcont,
                                    obscureText:passToggle,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Password',
                                      prefixIcon:Icon(Icons.lock),
                                      suffix: InkWell(
                                        onTap: (){
                                          setState(() {
                                            passToggle = !passToggle;
                                          });
                                        },
                                        child: Icon(passToggle ? Icons.visibility:Icons.visibility_off_outlined),
                                      ),
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return "Enter password";
                                      }
                                      else if(passwordcont.text.length<6){
                                        return "Password leneth should be more than 6 characters";
                                      }
                                    },
                                  ),
                                ),
                              ]  ),
                        ),

                        ElevatedButton(

                            onPressed: () {
                              {
                                if(formKey.currentState!.validate()){
                                  print('success');
                                  usernameCont.clear();
                                  passwordcont.clear();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return const mainApp();
                                      }));
                                }
                              }
                            },

                            child: Text('login')
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const loginPage();
                                  }));
                            },
                            child: Text('forgot your password?')
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                              });
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const animation();
                                  }));
                            },
                            child: Text('animation page')),


                      ] ),
                ),
              ),
            ),
          ),
        );

      }),
    );
  }
}