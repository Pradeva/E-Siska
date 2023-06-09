import 'package:flutter/material.dart';
import 'package:tubesabp/pengumuman.dart';
import 'package:tubesabp/Announcement_Data.dart';
import 'griddashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

Future<List<Announcement_Data>> fetchAnnouncement() async {
  final res =
      await http.get(Uri.parse('http://192.168.43.118:8000/api/announcement'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed
        .map<Announcement_Data>((json) => Announcement_Data.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class HomeState extends State<Home> {
  void handlePengumumanTap() {
    // Perform actions when the "Pengumuman" container is tapped
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengumuman'), duration: Duration(seconds: 1)),
    );
  }

  void handleUserButtonTap() {
    // Perform actions when the user button is tapped
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profil'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 380,
              decoration: BoxDecoration(
                color: Color.fromRGBO(151, 188, 232, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Selamat datang,",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Muhammad Reza",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          alignment: Alignment.topCenter,
                          icon: Image.asset(
                            "assets/user.png",
                            width: 100,
                          ),
                          onPressed: handleUserButtonTap,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: handlePengumumanTap,
                    child: FutureBuilder(
                      future: fetchAnnouncement(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final judul =
                              snapshot.data![snapshot.data!.length - 1].judul;
                          final pesan =
                              snapshot.data![snapshot.data!.length - 1].pesan;

                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 200,
                            width: 350,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  judul,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  pesan,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GridDashboard()
          ],
        ),
      ),
    );
  }
}
