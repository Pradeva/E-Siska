import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const Announcement());
}

class Announcement extends StatelessWidget {
  const Announcement({super.key});

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
  final data = const [
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"},
    {"nama": "Pengumuman", "Hp": "Pemberitahuan"}
  ];

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
        child: Container(
          color: Color.fromRGBO(151, 188, 232, 1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: Text("Pengumuman",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: Colors.white)),
                margin: EdgeInsets.only(
                  left: 178,
                  top: 35,
                ),
              ),
              // Disini
              Container(
                height: 643,
                width: 339,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 240, 240, 1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            Offset(0, 3), // changes the position of the shadow
                      ),
                    ]),
                margin: EdgeInsets.only(top: 40),
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (Context, index) {
                      return GestureDetector(
                          child: Padding(
                        padding: EdgeInsets.all(17.0),
                        child: Container(
                          width: 322,
                          height: 141,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Container(
                                child: Text(data[index]["nama"]!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(79, 79, 79, 1),
                                        fontFamily: "Quicksand")),
                                margin: EdgeInsets.only(right: 170, top: 20),
                              ),
                              Container(
                                child: Text(data[index]["Hp"]!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: "Quicksand")),
                                margin: EdgeInsets.only(right: 135, top: 17),
                              ),
                            ],
                          ),
                          // child: ListTile(
                          //   title: Text(data[index]["nama"]! + '\n' + data[index]["Hp"]!),
                          // ),
                        ),
                      ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
