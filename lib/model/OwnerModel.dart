class Owner {
  String namaDepan;
  String namaBelakang;
  String alamat;
  String noHp;
  String foto;
  String noRekening;
  String rekening;

  Owner(
      {this.namaDepan,
      this.namaBelakang,
      this.alamat,
      this.noHp,
      this.rekening,
      this.noRekening,
      this.foto});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
        namaDepan: json['nama_depan'],
        namaBelakang: json['nama_belakang'],
        alamat: json['alamat'],
        noHp: json['no_hp'],
        rekening: json['rekening'],
        noRekening: json['no_rekening'],
        foto: json['foto']);
  }
}
