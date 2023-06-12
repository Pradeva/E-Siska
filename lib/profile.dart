import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'login.dart';

void main() {
  runApp(Profile(username: username,));
}

String getStatusText(int status) {
  if (status == 1) {
    return 'Admin';
  } else if (status == 2) {
    return 'HRD';
  } else {
    return 'Karyawan'; // return an empty string for other status values if needed
  }
}

class Profile extends StatelessWidget {
  const Profile({required this.username});
  final Map<String, dynamic> username;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.only(top: 30),
                    width: 60,
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/user.png'),
                          ),
                        ),
                      ),
                    ),

                    margin: EdgeInsets.only(top: 30),
                  ),
                  Container(
                    height: 48,
                    width: 137,
                    child: Text(username['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'Poppins')),
                    margin: EdgeInsets.only(top: 18),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(151, 188, 232, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
              ),
              margin: EdgeInsets.only(bottom: 30),
            ),
            Text("Total Gaji",
                style: TextStyle(
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
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(top: 28),
              child: Container(
                child: Text('Rp. ${username["gaji_total"]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                  Text('Informasi Karyawan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      )),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width : 50,
                          child: Text("Nama",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(179, 179, 181, 1))),
                          margin: EdgeInsets.only(left: 50),
                        ),
                        Container(
                          child: Text(username["name"],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              )),
                          margin: EdgeInsets.only(left: 83),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 36),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width : 50,
                          child: Text("Email",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(179, 179, 181, 1))),
                          margin: EdgeInsets.only(left: 50),
                        ),
                        Container(
                          child: Text(username["email"],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              )),
                          margin: EdgeInsets.only(left: 83),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 18),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width : 50,
                          child: Text("HP",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(179, 179, 181, 1))),
                          margin: EdgeInsets.only(left: 50),
                        ),
                        Container(
                          child: Text(username["telp"].toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              )),
                          margin: EdgeInsets.only(left: 83),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 18),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 19),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width : 50,
                    child: Text("Role",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Color.fromRGBO(179, 179, 181, 1))),
                    margin: EdgeInsets.only(left: 50),
                  ),
                  Container(
                    child: Text('${getStatusText(username["role"])}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        )),
                    margin: EdgeInsets.only(left: 83),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 18),
            ),

          ],
        ),
      ),
    );
  }
}
