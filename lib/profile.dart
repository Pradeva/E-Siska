import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(

                    child: Text("Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        )),
                    margin: EdgeInsets.only(
                        top: 30
                    ),
                    width: 52,
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/user.png'),
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: 30
                    ),
                  ),
                  Container(
                    height: 48,
                    width: 137,
                    child: Text("Pradeva", style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontFamily: 'Poppins'
                    )),
                    margin: EdgeInsets.only(
                        top: 18,
                        left: 20
                    ),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(151, 188, 232, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80)
                ),
              ),
              margin: EdgeInsets.only(
                  bottom: 30
              ),
            ),
            Text("Total Gaji",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: Color.fromRGBO(179, 179, 181, 1),
            )),
            Container(
              height: 65,
              width: 292,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(28, 45, 64, 1),
                  borderRadius: BorderRadius.circular(20)
              ),
              margin: EdgeInsets.only(
                  top: 28
              ),
              child: Container(
                child: Text("Rp. 2.000.000,-", style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                )),
                margin: EdgeInsets.only(
                  top: 17,
                  bottom: 18,
                  left: 67,
                  right: 66,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text('Informasi Karyawan', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                  )),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text("Nama", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color.fromRGBO(179, 179, 181, 1)
                          )),
                          margin: EdgeInsets.only(
                              left: 50
                          ),
                        ),
                        Container(
                          child: Text("Pradeva Fairuz Zabbar", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          )),
                          margin: EdgeInsets.only(
                              left: 104
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        top: 36
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text("Email", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color.fromRGBO(179, 179, 181, 1)
                          )),
                          margin: EdgeInsets.only(
                              left: 50
                          ),
                        ),
                        Container(
                          child: Text("pradevafairuz@gmail.com", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          )),
                          margin: EdgeInsets.only(
                              left: 83
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        top: 18
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text("HP", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color.fromRGBO(179, 179, 181, 1)
                          )),
                          margin: EdgeInsets.only(
                              left: 50
                          ),
                        ),
                        Container(
                          child: Text("081381218850", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          )),
                          margin: EdgeInsets.only(
                              left: 180
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        top: 18
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                  top: 19
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Text("Role", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(179, 179, 181, 1)
                    )),
                    margin: EdgeInsets.only(
                        left: 50
                    ),
                  ),
                  Container(
                    child: Text("Karyawan", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    )),
                    margin: EdgeInsets.only(
                        left: 207
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                  top: 18
              ),
            ),
            Container(
              width: 128,
              height: 37,
              child: Container(

                child: Text("LOG OUT", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: 18,
                    fontWeight: FontWeight.w800)
                        ),
                margin: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 25,
                  right: 25,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(174, 32, 37, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes the position of the shadow
                    ),
                  ]
              ),

              margin: EdgeInsets.only(
                  top: 40
              ),
            ),
          ],
        ),
      ),
    );
  }
}
