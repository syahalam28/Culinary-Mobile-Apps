class History {
  int? id_transaksi;
  int? id_summary;
  double? trans_total;
  String? trans_date;
  int? jumlah_orang;
  int? kode_unik;
  double? saldo;

  History(
      {this.id_summary,
      this.id_transaksi,
      this.jumlah_orang,
      this.kode_unik,
      this.trans_date,
      this.trans_total,
      this.saldo});

  factory History.fromJson(Map<String, dynamic> json) => History(
        id_transaksi: int.parse(json["id_transaksi"]),
        id_summary: int.parse(json["id_summary"]),
        jumlah_orang: int.parse(json["jumlah_orang"]),
        kode_unik: int.parse(json["kode_unik"]),
        trans_total: double.parse(json["trans_total"]),
        trans_date: json['trans_date'],
        saldo: double.parse(json["saldo"]),
      );
}
