class Cuti_Data {
  final String users_id;
  final String lama_cuti;
  final String tanggal_cuti;

  const Cuti_Data({
    required this.users_id,
    required this.lama_cuti,
    required this.tanggal_cuti,
  });

  factory Cuti_Data.fromJson(Map<String, dynamic> json) {
    return Cuti_Data(
      users_id: json['users_id'],
      lama_cuti: json['lama_cuti'],
      tanggal_cuti: json['tanggal_cuti'],
    );
  }
}
