
import 'package:flutter/material.dart';

void main() {
  runApp(const CutiForm());
}

class CutiForm extends StatelessWidget {
  const CutiForm({super.key});

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

class _CutiState extends State<Cuti> {
  DateTime? selectedDate;
  TextEditingController lamaCutiController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff97bce8),
          elevation: 0,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
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
                      padding: const EdgeInsets.only(top: 59, ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
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
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                              color: Color(0xfffbfbfb),
                            ),
                            padding: const EdgeInsets.only(left: 24, right: 25, top: 61, bottom: 35, ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 16.0),
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
                                      labelText: '    Lama Cuti (dalam jam)',
                                      labelStyle: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14.0
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10), // Corner radius
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
                                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                                      child: Text(
                                        selectedDate == null
                                            ? 'Pilih Tanggal Cuti'
                                            : 'Tanggal Cuti: ${selectedDate.toString()}',
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60.0),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (selectedDate != null && lamaCutiController.text.isNotEmpty) {
                                        String tanggalCuti = selectedDate.toString();
                                        int lamaCuti = int.parse(lamaCutiController.text);
                                        print('Tanggal Cuti: $tanggalCuti');
                                        print('Lama Cuti: $lamaCuti jam');
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
                                        borderRadius: BorderRadius.circular(10), // Corner radius
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

                    )
                )
              ],
            )
        )
    );
  }
}

