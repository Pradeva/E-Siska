class Absen_Data {
  final int id;
  final String waktu_absen;
  final int users_id;

  const Absen_Data({
    required this.id,
    required this.waktu_absen,
    required this.users_id,
  });

  factory Absen_Data.fromJson(Map<String, dynamic> json) {
    return Absen_Data(
      id: json['id'],
      waktu_absen: json['waktu_absen'],
      users_id: json['users_id'],
    );
  }
}
