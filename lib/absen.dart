import 'package:flutter/material.dart';

void main() {
  runApp(const Absen());
}

class Absen extends StatelessWidget {
  const Absen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absen Page',
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
        scaffoldBackgroundColor: Color(0xFF97BCE8),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF97BCE8),
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                left: 0, right: 0, child: Container(
              width: double.maxFinite,
              color: Color(0XFF97BCE8),
              padding: const EdgeInsets.only(top: 59),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/machine.png"),
                  SizedBox(height: 57),
                  Text("Absensi", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 25,),
                  Container(
                    width: double.maxFinite,
                    height: 513,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                        color: Color(0XFFFBFBFB)
                    ),
                    padding: const EdgeInsets.only(left: 24, right: 25, top: 61, bottom: 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.0,),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0XFFF4F4F4),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Color(0XBFFFFFF),
                                blurRadius: 15,
                                offset: Offset(-10,-10)
                            )],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  width: 223,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color(0XFFAE2025),
                                  ),
                                  child: Text("12:30",textAlign: TextAlign.center,style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 70
                                  ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 150.0,),
                        Container(
                          child: ElevatedButton(
                            onPressed: (){

                            }, child: Text(
                            "Absen",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16
                            ),
                          ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff1c2c3f),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(200,50)
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
