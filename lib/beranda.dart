import 'package:flutter/material.dart';
import 'package:tubesabp/login.dart';
import 'package:tubesabp/pengumuman.dart';
import 'package:tubesabp/profile.dart';
import 'griddashboard.dart';

void main() => runApp(MaterialApp(
      home: Home(
        username: username,
      ),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  Home({required this.username});
  final String username;

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  void handlePengumumanTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Announcement()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pengumuman'), duration: Duration(seconds: 1)),
    );
  }

  void handleUserButtonTap() {
    // Perform actions when the user button is tapped
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Profile()));
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
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              username,
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
                    child: Container(
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
                            "Pengumuman",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eu mi nec turpis convallis dignissim at id massa.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
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
