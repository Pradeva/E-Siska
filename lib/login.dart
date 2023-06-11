import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tubesabp/beranda.dart';
import 'package:http/http.dart' as http;
import 'package:tubesabp/main.dart';
import 'package:tubesabp/user.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

Map<String, dynamic> username = {};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login Page',
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
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(
              username: username,
            ),
      },
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
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg = '';

  Future<List> _login() async {
    final response = await http
        .post(Uri.parse('http://192.168.43.22:8000/api/login'), body: {
      "email": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);

    if (datauser['success']) {
      Navigator.pushReplacementNamed(context, '/Home');
    } else {
      setState(() {
        msg = "Email / Password Salah";
      });
    }

    setState(() {
      username = datauser["user"];
    });

    print(username);

    return datauser;
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "E-SISKA",
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset('assets/login.png'),
            SizedBox(
              height: 50,
            ),
            Text('SILAHKAN LOG IN',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),
            TextFormField(
              controller: user,
              style: new TextStyle(
                fontFamily: 'Poppins',
              ),
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                hintText: 'Masukkan Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Color(0xFF97BCE8)),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextFormField(
              controller: pass,
              style: new TextStyle(fontFamily: 'Poppins'),
              onChanged: (value) {
                setState(() {});
              },
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                fillColor: Colors.white,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  borderSide: BorderSide(color: Color(0xFF97BCE8)),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.all(20),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Color(0xFF3D77BB)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                child: const Text('LOG IN'),
                onPressed: () {
                  _login();
                },
              ),
            ),
            Text(
              msg,
              style: TextStyle(fontSize: 30, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
