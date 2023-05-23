import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart' as telplauncher;

void main() {
  runApp(const listKaryawan());
}

class listKaryawan extends StatelessWidget{
  const listKaryawan({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'List Karyawan' ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Karyawan'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key , required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  final data = const [
    {"nama": "Elroi Yoshua", "Hp": "081322658091"},
    {"nama": "Dedod1", "Hp": "081322658090"},
    {"nama": "edod132", "Hp": "081322658087"},
    {"nama": "edod121e", "Hp": "081322658098"},
    {"nama": "edod11231a", "Hp": "081322658092"},
    {"nama": "edod1131a", "Hp": "081322658096"},
    {"nama": "edod11e1", "Hp": "081322658095"},
    {"nama": "edod12", "Hp": "081322658093"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF97BCE8),

        body: SafeArea(
          child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical : 10),
                  child : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Container(
                                //   width: 25, // Adjust the width as per your requirements
                                //   height: 25, // Adjust the height as per your requirements
                                //   child: Image.asset('assets/back.png'), // Replace with your image path
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: 120,
                        child: Column(
                          children: [
                            Image.asset('assets/shortlist.png'),
                            Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text("List Karyawan",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 18
                                  ),)
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            // controller: _searchController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Cari Karyawan',
                              hintStyle: TextStyle(color : Colors.white,fontFamily: 'Poppins'),
                              prefixIcon: Icon(Icons.search,color: Colors.white,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            // onChanged: (value) {
                            //   // Handle search query
                            //   print(value);
                            // },
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(

                        width: 325,
                        height: 400,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30)),
                        child:ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (Context, index){
                            return GestureDetector(
                                child : Padding(
                                  padding: EdgeInsets.all(17.0),
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(

                                          child: Text(data[index]["nama"]!,textAlign: TextAlign.left,style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(79, 79, 79, 1),
                                              fontFamily: "Quicksand",

                                          ),),
                                          margin: EdgeInsets.only(
                                              right: 170,
                                              top: 10
                                          ),
                                        ),
                                        Container(
                                          child: Text(data[index]["Hp"]!,textAlign: TextAlign.left,style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: "Quicksand"
                                          )),
                                          margin: EdgeInsets.only(
                                              right: 135,
                                              top: 17
                                          ),
                                        ),
                                      ],
                                    ),
                                    // child: ListTile(
                                    //   title: Text(data[index]["nama"]! + '\n' + data[index]["Hp"]!),
                                    // ),
                                  ),
                                )
                            );
                          }
                      ),
                      ),
                    ],
                  )
              )
          ),
        )
    );
  }
}
