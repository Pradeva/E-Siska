class Lembur_Data {
  final String users_id;
  final String lama_lembur;
  final String tanggal_lembur;

  const Lembur_Data({
    required this.users_id,
    required this.lama_lembur,
    required this.tanggal_lembur,
  });

  factory Lembur_Data.fromJson(Map<String, dynamic> json) {
    return Lembur_Data(
      users_id: json['users_id'],
      lama_lembur: json['lama_lembur'],
      tanggal_lembur: json['tanggal_lembur'],
    );
  }
}
