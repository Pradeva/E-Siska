class Lembur_Data {
  final int id;
  final int lama_lembur;
  final int disetujui;

  const Lembur_Data({
    required this.id,
    required this.lama_lembur,
    required this.disetujui,
  });

  factory Lembur_Data.fromJson(Map<String, dynamic> json) {
    return Lembur_Data(
      id: json['id'],
      lama_lembur: json['lama_lembur'],
      disetujui: json['disetujui'],
    );
  }
}
