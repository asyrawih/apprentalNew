import 'package:apprental/model/OwnerModel.dart';

class Cars {
  String jenis;
  String modelTahun;
  String platPolisi;
  String noChasis;
  String kapasitas;
  String warna;
  String gambar;
  Owner owner;

  Cars(
      {this.jenis,
      this.noChasis,
      this.platPolisi,
      this.modelTahun,
      this.owner,
      this.warna,
      this.kapasitas,
      this.gambar});

  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      jenis: json['jenis'],
      modelTahun: json['model_tahun'],
      platPolisi: json['plat_polisi'],
      noChasis: json['nomor_chasis'],
      kapasitas: json['kapasitas'].toString(),
      gambar: json['gambar'],
      warna: json['warna'],
      owner: Owner.fromJson(json['owner']),
    );
  }
}
