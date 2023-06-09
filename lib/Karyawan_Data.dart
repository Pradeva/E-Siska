import 'Cuti_Data.dart';
import 'Lembur_Data.dart';

class Karyawan_Data {
  final int id;
  final List<dynamic> lembur;
  final List<dynamic> cuti;
  final String name;

  const Karyawan_Data(
      {required this.id,
      required this.lembur,
      required this.cuti,
      required this.name});

  factory Karyawan_Data.fromJson(Map<String, dynamic> json) {
    return Karyawan_Data(
        id: json['id'],
        lembur: json['lembur'],
        cuti: json['cuti'],
        name: json['name']);
  }
}
