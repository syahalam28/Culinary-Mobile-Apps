class TransaksiKembali {
  int? id_refund;
  int? id_transaksi;
  double? total;
  double? kembali;

  TransaksiKembali({
    this.id_refund,
    this.id_transaksi,
    this.total,
    this.kembali,
  });

  factory TransaksiKembali.fromJson(Map<String, dynamic> json) =>
      TransaksiKembali(
        id_transaksi: int.parse(json["id_transaksi"]),
        id_refund: int.parse(json["id_refund"]),
        total: double.parse(json["total"]),
        kembali: double.parse(json["kembali"]),
      );
}
