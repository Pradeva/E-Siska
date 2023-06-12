// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:tubesabp/Karyawan_Data.dart';
// import 'package:flutter/material.dart';
// import 'login.dart';
//
// void main() {
//   runApp(LemburForm(username: username,));
// }
//
// Future<List<Karyawan_Data>> fetchKaryawan() async {
//   final res =
//       await http.get(Uri.parse('http://192.168.43.22:8000/api/karyawan'));
//   if (res.statusCode == 200) {
//     var data = jsonDecode(res.body);
//     var parsed = data['list'].cast<Map<String, dynamic>>();
//     return parsed
//         .map<Karyawan_Data>((json) => Karyawan_Data.fromJson(json))
//         .toList();
//   } else {
//     throw Exception('Failed');
//   }
// }
//
// String getStatusText(int status) {
//   if (status == 1) {
//     return 'Disetujui';
//   } else if (status == 2) {
//     return 'Ditolak';
//   } else {
//     return 'Belum di proses'; // return an empty string for other status values if needed
//   }
// }
//
// class LemburForm extends StatelessWidget {
//   const LemburForm({required this.username});
//   final Map<String, dynamic> username;
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Lembur',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Lembur(title: 'Lembur'),
//     );
//   }
// }
//
// class Lembur extends StatefulWidget {
//   const Lembur({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<Lembur> createState() => _LemburState();
// }
//
// class _LemburState extends State<Lembur> {
//   DateTime? selectedDate;
//   TextEditingController lamaLemburController = TextEditingController();
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2025),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xff97bce8),
//           elevation: 0,
//           // leading: IconButton(
//           //   icon: Icon(Icons.arrow_back),
//           //   onPressed: () {
//           //     Navigator.pop(context);
//           //   },
//           // ),
//         ),
//         body: SafeArea(
//             child: Stack(
//           children: [
//             Positioned(
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   width: double.maxFinite,
//                   color: Color(0xff97bce8),
//                   padding: const EdgeInsets.only(
//                     top: 59,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 80,
//                         height: 80,
//                         child: Image.asset('assets/overtime.png'),
//                       ),
//                       SizedBox(height: 57),
//                       Text(
//                         "Lembur",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontFamily: "Poppins",
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       SizedBox(height: 57),
//                       Container(
//                         width: double.maxFinite,
//                         height: 513,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30),
//                             topRight: Radius.circular(30),
//                             bottomLeft: Radius.circular(0),
//                             bottomRight: Radius.circular(0),
//                           ),
//                           color: Color(0xfffbfbfb),
//                         ),
//                         padding: const EdgeInsets.only(
//                           left: 24,
//                           right: 25,
//                           top: 61,
//                           bottom: 35,
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 322,
//                               height: 141,
//                               decoration: BoxDecoration(
//                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                   borderRadius: BorderRadius.circular(30)),
//                               child: FutureBuilder(
//                                 future: fetchKaryawan(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState ==
//                                       ConnectionState.waiting) {
//                                     return CircularProgressIndicator();
//                                   } else if (snapshot.hasError) {
//                                     return Text('Error: ${snapshot.error}');
//                                   } else {
//                                     var i = 0;
//                                     var lembur;
//                                     while (i < snapshot.data!.length){
//                                       if (snapshot.data![i].id == username['id']){
//                                         lembur = snapshot.data![i].lembur;
//                                       }
//                                       i++;
//                                     }
//                                     if (lembur != null){
//                                       return ListView.builder(
//                                         itemCount: lembur.length,
//                                         itemBuilder: (context, index) {
//                                           return Container(
//                                             width: 100,
//                                             height: 50,
//                                             decoration: BoxDecoration(
//                                                 color: Color(0xff97bce8),
//                                                 borderRadius:
//                                                 BorderRadius.circular(10)),
//                                             child: Text(
//                                               'Lama Lembur: ${lembur[index]["lama_lembur"]} hari\n'
//                                                   'Tanggal Lembur: ${lembur[index]["tanggal_lembur"]}\n'
//                                                   'Status: ${getStatusText(lembur[index]["disetujui"])}',
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           );
//                                         },
//                                       );
//                                     } else {
//                                       return Text("Belum Ada Lembur",
//                                           textAlign: TextAlign.center);
//                                     }
//                                   }
//                                 },
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFF4F4F4),
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0xbfffffff),
//                                     blurRadius: 15,
//                                     offset: Offset(-10, -10),
//                                   ),
//                                 ],
//                               ),
//                               child: TextField(
//                                 controller: lamaLemburController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   labelText: '    Lama Lembur (dalam jam)',
//                                   labelStyle: TextStyle(
//                                       fontFamily: "Poppins", fontSize: 14.0),
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         10), // Corner radius
//                                     borderSide: BorderSide(
//                                       color: Colors.transparent,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 16.0),
//                             Container(
//                               width: 365,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Color(0xbfffffff),
//                                     blurRadius: 15,
//                                     offset: Offset(-10, -10),
//                                   ),
//                                 ],
//                                 color: Color(0xfff4f4f4),
//                               ),
//                               child: GestureDetector(
//                                 onTap: () => _selectDate(context),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFF4F4F4),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 12.0, vertical: 16.0),
//                                   child: Text(
//                                     selectedDate == null
//                                         ? 'Pilih Tanggal Lembur'
//                                         : 'Tanggal Lembur: ${selectedDate.toString()}',
//                                     style: TextStyle(
//                                       fontFamily: "Poppins",
//                                       fontSize: 14.0,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 20.0),
//                             Container(
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   if (selectedDate != null &&
//                                       lamaLemburController.text.isNotEmpty) {
//                                     String tanggalLembur =
//                                         selectedDate.toString();
//                                     int lamaLembur =
//                                         int.parse(lamaLemburController.text);
//                                     print('Tanggal Lembur: $tanggalLembur');
//                                     print('Lama Lembur: $lamaLembur jam');
//                                   }
//                                 },
//                                 child: Text(
//                                   'SIMPAN',
//                                   style: TextStyle(
//                                     fontFamily: "Poppins",
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Color(0xff1c2c3f),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(
//                                         10), // Corner radius
//                                   ),
//                                   minimumSize: Size(200, 50),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         )));
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tubesabp/Karyawan_Data.dart';
import 'package:tubesabp/login.dart';
import 'package:tubesabp/Lembur_Data.dart';
import 'package:intl/intl.dart';

void main() {
  runApp( LemburForm(username: username,));

}

Future<List<Karyawan_Data>> fetchKaryawan() async {
  final res =
  await http.get(Uri.parse('http://192.168.43.22:8000/api/karyawan'));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed
        .map<Karyawan_Data>((json) => Karyawan_Data.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class LemburForm extends StatelessWidget {
  const LemburForm({required this.username});
  final Map<String, dynamic> username;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lembur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Lembur(title: 'Lembur'),
    );
  }
}

class Lembur extends StatefulWidget {
  const Lembur({super.key, required this.title});

  final String title;

  @override
  State<Lembur> createState() => _LemburState();
}

Future<Map<String, dynamic>> addLembur(_tanggalLembur, _lamaLembur, _usersId) async {
  final res = await http.post(
      Uri.parse('http://192.168.43.22:8000/api/lembur'),
      body: {
        "users_id" : _usersId,
        "lama_lembur" : _lamaLembur,
        "tanggal_lembur" : _tanggalLembur
      }
  );
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }else{
    throw Exception('Failed');
  }
}

String getStatusText(int status) {
  if (status == 1) {
    return 'Disetujui';
  } else if (status == 2) {
    return 'Ditolak';
  } else {
    return 'Belum di proses'; // return an empty string for other status values if needed
  }
}

class _LemburState extends State<Lembur> {
  DateTime? selectedDate;
  var lamaLemburController = TextEditingController();
  late Future<List<Karyawan_Data>> karyawan;
  @override
  void initState(){
    super.initState();
    karyawan = fetchKaryawan();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked.toLocal();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff97bce8),
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
                      color: Color(0xff97bce8),
                      padding: const EdgeInsets.only(
                        top: 59,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.asset('assets/overtime.png'),
                          ),
                          SizedBox(height: 57),
                          Text(
                            "Lembur",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 57),
                          Container(
                            width: double.maxFinite,
                            height: 513,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              color: Color(0xfffbfbfb),
                            ),
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 25,
                              top: 61,
                              bottom: 35,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 16.0),
                                Container(
                                  width: 322,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: FutureBuilder(
                                    future: fetchKaryawan(),
                                    builder: (context, snapshot) {
                                      // if (snapshot.connectionState ==
                                      //     ConnectionState.waiting) {
                                      //   return CircularProgressIndicator();
                                      // }
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        var i = 0;
                                        var lembur;
                                        while (i < snapshot.data!.length){
                                          if (snapshot.data![i].id == username['id']){
                                            lembur = snapshot.data![i].lembur;
                                          }
                                          i++;
                                        }
                                        if (lembur != null){
                                          return ListView.builder(
                                            itemCount: lembur.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                width: 20,
                                                child: Column(
                                                  children: [
                                                    SizedBox(height: 10,),
                                                    Container(width: 365,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          color: Color(0xFFF4F4F4),
                                                          borderRadius:
                                                          BorderRadius.circular(10)),
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 2.0, vertical: 5.0),
                                                      child: Text(
                                                        'Lama Lembur: ${lembur[index]["lama_lembur"]} jam\n'
                                                            'Tanggal Lembur: ${lembur[index]["tanggal_lembur"]}\n'
                                                            'Status: ${getStatusText(lembur[index]["disetujui"])}',
                                                        textAlign: TextAlign.center,
                                                      ),),

                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Text("Belum Ada Lembur", textAlign: TextAlign.center);
                                        }
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF4F4F4),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xbfffffff),
                                        blurRadius: 15,
                                        offset: Offset(-10, -10),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: lamaLemburController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: '    Lama Lembur (dalam jam)',
                                      labelStyle: TextStyle(
                                          fontFamily: "Poppins", fontSize: 14.0),
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Corner radius
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                Container(
                                  width: 365,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xbfffffff),
                                        blurRadius: 15,
                                        offset: Offset(-10, -10),
                                      ),
                                    ],
                                    color: Color(0xfff4f4f4),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF4F4F4),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 16.0),
                                      child: Text(
                                        selectedDate == null
                                            ? 'Pilih Tanggal Lembur'
                                            : 'Tanggal Lembur: ${DateFormat('dd-MM-yyyy').format(selectedDate).toString()}',
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Container(

                                  child: ElevatedButton(
                                    onPressed: () async {

                                      var res = await addLembur(selectedDate.toString().substring(0,10), lamaLemburController.text.toString(), username["id"].toString());

                                      if (res['error']) {
                                        var snackBar = SnackBar(content: Text("Data tidak ditambahkan!"));
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      } else {
                                        var snackBar = SnackBar(content: Text("Data berhasil ditambahkan!"));
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        setState(() {
                                          karyawan = fetchKaryawan();
                                        });
                                      }
                                    },
                                    child: Text(
                                      'SIMPAN',
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff1c2c3f),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10), // Corner radius
                                      ),
                                      minimumSize: Size(200, 50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ))
    );

  }
}
