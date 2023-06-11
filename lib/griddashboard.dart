import 'package:flutter/material.dart';
import 'package:tubesabp/cuti.dart';
import 'package:tubesabp/lembur.dart';
import 'package:tubesabp/listkaryawan.dart';
import 'package:tubesabp/beranda.dart';
import 'absen.dart';

class GridDashboard extends StatelessWidget {
  GridDashboard({required this.username});
  Items item1 = new Items(title: "Lembur", img: "assets/overtime.png");
  Items item2 = new Items(title: "Cuti", img: "assets/schedule.png");
  Items item3 = new Items(title: "Absen", img: "assets/machine.png");
  Items item4 = new Items(title: "List Karyawan", img: "assets/shortlist.png");
  Map<String, dynamic> username;

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xFF453685;

    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.3,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              if (data.title == "Lembur") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LemburForm(username: username,)));
              } else if (data.title == "Cuti") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CutiForm(username: username,)));
              } else if (data.title == "Absen") {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Absen(username: username,)));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListApp()));
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(data.title),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(218, 234, 246, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String img;
  Items({required this.title, required this.img});
}
