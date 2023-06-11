class Announcement_Data {
  final int id;
  final String judul;
  final String pesan;

  const Announcement_Data({
    required this.id,
    required this.judul,
    required this.pesan,
  });

  factory Announcement_Data.fromJson(Map<String, dynamic> json) {
    return Announcement_Data(
      id: json['id'],
      judul: json['judul'],
      pesan: json['pesan'],
    );
  }
}
