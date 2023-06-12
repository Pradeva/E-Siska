import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tubesabp/Karyawan_Data.dart';
import 'package:tubesabp/login.dart';
import 'package:tubesabp/Cuti_Data.dart';
import 'package:intl/intl.dart';

void main() {
  runApp( CutiForm(username: username,));

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

class CutiForm extends StatelessWidget {
  const CutiForm({required this.username});
  final Map<String, dynamic> username;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Cuti(title: 'Cuti'),
    );
  }
}

class Cuti extends StatefulWidget {
  const Cuti({super.key, required this.title});

  final String title;

  @override
  State<Cuti> createState() => _CutiState();
}

Future<Map<String, dynamic>> addCuti(_tanggalCuti, _lamaCuti, _usersId) async {
  final res = await http.post(
    Uri.parse('http://192.168.43.22:8000/api/cuti'),
    body: {
      "users_id" : _usersId,
      "lama_cuti" : _lamaCuti,
      "tanggal_cuti" : _tanggalCuti
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

class _CutiState extends State<Cuti> {
  DateTime? selectedDate;
  var lamaCutiController = TextEditingController();
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
                        child: Image.asset('assets/schedule.png'),
                      ),
                      SizedBox(height: 57),
                      Text(
                        "Cuti",
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
                                    var cuti;
                                    while (i < snapshot.data!.length){
                                     if (snapshot.data![i].id == username['id']){
                                       cuti = snapshot.data![i].cuti;
                                     }
                                     i++;
                                    }
                                    if (cuti != null){
                                      return ListView.builder(
                                        itemCount: cuti.length,
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
                                                    'Lama Cuti: ${cuti[index]["lama_cuti"]} hari\n'
                                                        'Tanggal Cuti: ${cuti[index]["tanggal_cuti"]}\n'
                                                        'Status: ${getStatusText(cuti[index]["disetujui"])}',
                                                    textAlign: TextAlign.center,
                                                  ),),

                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Text("Belum Ada Cuti", textAlign: TextAlign.center);
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
                                controller: lamaCutiController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: '    Lama Cuti (dalam hari)',
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
                                        ? 'Pilih Tanggal Cuti'
                                        : 'Tanggal Cuti: ${DateFormat('dd-MM-yyyy').format(selectedDate).toString()}',
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

                                  var res = await addCuti(selectedDate.toString().substring(0,10), lamaCutiController.text.toString(), username["id"].toString());

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
