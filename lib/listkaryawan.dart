import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as telplauncher;

import 'package:http/http.dart' as http;
import 'User_Data.dart';

void main() {
  runApp(const ListApp());
}

class ListApp extends StatelessWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Karyawan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Karyawan'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<List<user>> fetchUser() async {
  final res =
      await http.get(Uri.parse('http://192.168.43.118:8000/api/karyawan'));
  if (res.statusCode != 200) {
    print("Data tidak masuk");
    throw Exception('Failed');
  } else {
    print("Data masuk");
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    print(parsed);
    return parsed.map<user>((json) => user.fromJson(json)).toList();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<user>> users;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    users = fetchUser();
  }

  Future<void> launchPhoneDialer(String phoneNumber) async {
    final Uri url = Uri(
      scheme: 'tel',
      path: "$phoneNumber",
    );
    if (await telplauncher.canLaunchUrl(url)) {
      await telplauncher.launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF97BCE8),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 120,
                  child: Column(
                    children: [
                      Image.asset('assets/shortlist.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "List Karyawan",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Cari Karyawan',
                        hintStyle: TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Trigger a rebuild with the new search query
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 325,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FutureBuilder<List<user>>(
                      future: users,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text(
                                'Tidak ada data',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 28),
                              ),
                            );
                          }

                          final List<user> filteredUsers = snapshot.data!
                              .where((user) => user.name.toLowerCase().contains(
                                  _searchController.text.toLowerCase()))
                              .toList();

                          return ListView.builder(
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Make an indirect phone call when an item is tapped
                                  launchPhoneDialer(filteredUsers[index].telp);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            filteredUsers[index].name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(79, 79, 79, 1),
                                              fontFamily: "Quicksand",
                                            ),
                                          ),
                                          margin: EdgeInsets.only(top: 5),
                                        ),
                                        Container(
                                          child: Text(
                                            filteredUsers[index].telp,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: "Quicksand",
                                            ),
                                          ),
                                          //margin: EdgeInsets.only(right: 135, top: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
