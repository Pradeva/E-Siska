import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login.dart';

void main() {
  runApp( Absen(username: username,));
}

class Absen extends StatelessWidget {
  const Absen({required this.username});
  final Map<String, dynamic> username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Absen Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF97BCE8),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF97BCE8),
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
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
                      Text(
                        "Absensi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 513,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Color(0XFFFBFBFB)),
                        padding: const EdgeInsets.only(
                            left: 24, right: 25, top: 61, bottom: 35),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0XFFF4F4F4),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0XBFFFFFF),
                                      blurRadius: 15,
                                      offset: Offset(-10, -10))
                                ],
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
                                      child: Text(
                                        currentTime,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Poppins",
                                            fontSize: 70),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 150.0,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Absen",
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xff1c2c3f),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: Size(200, 50)),
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
