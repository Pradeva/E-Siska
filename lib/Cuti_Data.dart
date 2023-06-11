class Cuti_Data {
  final int id;
  final int lama_cuti;
  final int disetujui;

  const Cuti_Data({
    required this.id,
    required this.lama_cuti,
    required this.disetujui,
  });

  factory Cuti_Data.fromJson(Map<String, dynamic> json) {
    return Cuti_Data(
      id: json['id'],
      lama_cuti: json['lama_cuti'],
      disetujui: json['disetujui'],
    );
  }
}
