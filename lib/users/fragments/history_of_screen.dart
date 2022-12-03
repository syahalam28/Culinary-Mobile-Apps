import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api_connection/api_connection.dart';
import 'package:flutter_ecommerce/main.dart';
import 'package:flutter_ecommerce/users/fragments/Restaurant_of_fragments.dart';
import 'package:flutter_ecommerce/users/fragments/dashboard_of_fragments.dart';
import 'package:flutter_ecommerce/users/model/history.dart';
import 'package:flutter_ecommerce/users/model/transaksi.dart';
import 'package:flutter_ecommerce/users/userPrefrences/current_user.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);
  final CurrentUser _currentUser = Get.put(CurrentUser());
  Future<List<History>> getCurrenUserCartList() async {
    List<History> cartListOfCurrentUser = [];
    try {
      var res = await http.post(
        Uri.parse(API.historyTransaksi),
        body: {"user_id": _currentUser.user.user_id.toString()},
      );
      if (res.statusCode == 200) {
        var responseBodyOfGetCurrentUserCartItems = jsonDecode(res.body);
        if (responseBodyOfGetCurrentUserCartItems['success'] == true) {
          (responseBodyOfGetCurrentUserCartItems['currentUserCartData'] as List)
              .forEach((eachCurrentUserCartItem) {
            cartListOfCurrentUser
                .add(History.fromJson(eachCurrentUserCartItem));
          });
        } else {
          // Fluttertoast.showToast(msg: "Error Occurred While Executing Query");
        }
      } else {
        Fluttertoast.showToast(msg: "Status code is not 200");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: " + e.toString());
    }

    return cartListOfCurrentUser;
  }

  addTransaksiRefund(
      id_transaksi, total_pembayaran, refund, saldoNasabah) async {
    try {
      // Insert
      var res = await http.post(Uri.parse(API.transaksiKembali), body: {
        "id_transaksi": id_transaksi.toString(),
        "total": total_pembayaran.toString(),
        "kembali": refund.toString(),
      });
      if (res.statusCode == 200) {
        var resBodyOfAddCart = jsonDecode(res.body);
        if (resBodyOfAddCart['success'] == true) {
          // Fluttertoast.showToast(msg: "Berhasil Tambah Data");
          // Kembalikan Salod
          try {
            var res = await http.post(Uri.parse(API.updateSaldo), body: {
              'saldo': saldoNasabah.toString(),
              'user_id': _currentUser.user.user_id.toString(),
            });
            if (res.statusCode == 200) {
              var resBodyOfAddCart = jsonDecode(res.body);
              if (resBodyOfAddCart['success'] == true) {
                Fluttertoast.showToast(msg: "Refund Berhasil ");
                // Hapus Resi
                try {
                  var res = await http.post(Uri.parse(API.deleteTrans), body: {
                    'id_transaksi': id_transaksi.toString(),
                  });
                  if (res.statusCode == 200) {
                    var resBodyOfAddCart = jsonDecode(res.body);
                    if (resBodyOfAddCart['success'] == true) {
                      Get.to(DashboardOfFragments());
                    } else {
                      Fluttertoast.showToast(msg: "Gagal Hapus Resi");
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Delete Resi is not 200");
                  }
                } catch (e) {
                  print("Error : " + e.toString());
                }

                // Akhir Hapus Resi
              } else {
                Fluttertoast.showToast(msg: "Refund Gagal");
              }
            } else {
              Fluttertoast.showToast(msg: "Refund Status Code Is Not 200 ");
            }
          } catch (e) {
            print("Error : " + e.toString());
          }
        } else {
          Fluttertoast.showToast(msg: "Gagal Tambah Data");
        }
      } else {
        Fluttertoast.showToast(msg: "Insert Data Status Code Not 200");
      }
    } catch (e) {
      print("Error : " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(118, 17, 28, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Custom AppBar Widget
              data2(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget data2(context) {
    return FutureBuilder(
        future: getCurrenUserCartList(),
        builder: (context, AsyncSnapshot<List<History>> dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (dataSnapShot.data == null) {
            return const Center(
              child: Text(
                "No Item Found",
              ),
            );
          }
          if (dataSnapShot.data!.length > 0) {
            return ListView.builder(
              itemCount: dataSnapShot.data!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (contex, index) {
                History eachClothItemRecord = dataSnapShot.data![index];
                double total_pembayaran = eachClothItemRecord.trans_total!;
                double refund = (total_pembayaran * 85 / 100);
                double saldoNasabah = eachClothItemRecord.saldo!;
                double totalKembali = saldoNasabah + refund;

                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.close_rounded),
                                  iconSize: 25,
                                  color: Colors.white30,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardOfFragments()),
                                    );
                                  },
                                ),
                                const Text(
                                  'Close',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share),
                                  iconSize: 20,
                                  color: Colors.white30,
                                  onPressed: () {
                                    FlutterShare.share(
                                        title: "Booking Code",
                                        text: "Kode Booking Anda : " +
                                            eachClothItemRecord.kode_unik
                                                .toString(),
                                        linkUrl: "");
                                  },
                                ),
                                const Text(
                                  'Share',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: TicketWidget(
                        width: 350,
                        height: 800,
                        isCornerRounded: true,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                height: 90,
                                width: 90,
                                child: Image.asset('images/octo.png'),
                              ),
                            ),
                            DottedLine(),
                            Container(
                              height: 110,
                              width: 110,
                              child: Image.network(
                                  'https://1.bp.blogspot.com/-zXiasUuw6Sc/YFDEyTTMR2I/AAAAAAAAEbM/NElK9ulVi4g5s_Sa4yCL96hzaajr_ST9wCLcBGAsYHQ/s1600/Logo%2BOCTO%2BMobile.png'),
                            ),
                            Text(
                              'Nominal',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 120, right: 90, top: 5),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                          MoneyFormatter(
                                              amount: eachClothItemRecord
                                                  .trans_total!,
                                              settings: MoneyFormatterSettings(
                                                symbol: 'Rp ',
                                                thousandSeparator: '.',
                                                decimalSeparator: ',',
                                                symbolAndNumberSeparator: '',
                                                fractionDigits: 0,
                                              )).output.symbolOnLeft,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                )),
                            Container(
                              child: Text('Booking Code'),
                            ),
                            Container(
                                child: QrImage(
                              data: eachClothItemRecord.kode_unik.toString(),
                              version: QrVersions.auto,
                              size: 200.0,
                            )),
                            Container(
                              child: Text('Please scan this barcode'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Waktu Transaksi'),
                                        Text(eachClothItemRecord.trans_date
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('Id transaksi'),
                                        Text(eachClothItemRecord.id_transaksi
                                            .toString()),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromRGBO(
                                                  118, 17, 28, 1),
                                            ),
                                            onPressed: () async {
                                              var responseFromDialogBox =
                                                  await Get.dialog(
                                                AlertDialog(
                                                  backgroundColor: Colors.white,
                                                  title: const Text(
                                                      "Are You Sure To Refund"),
                                                  content: const Text(
                                                      "Get Cashback 85%"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        "No",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Get.back(
                                                            result:
                                                                "yesDelete");
                                                      },
                                                      child: const Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                              if (responseFromDialogBox ==
                                                  "yesDelete") {
                                                // Function Refund
                                                addTransaksiRefund(
                                                    eachClothItemRecord
                                                        .id_transaksi,
                                                    eachClothItemRecord
                                                        .trans_total,
                                                    refund,
                                                    totalKembali);
                                              }
                                            },
                                            child: Text('Refund'))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("No Referensi"),
                                        Text(eachClothItemRecord.kode_unik
                                            .toString())
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Pembayaran'),
                                  Text(
                                      MoneyFormatter(
                                          amount:
                                              eachClothItemRecord.trans_total!,
                                          settings: MoneyFormatterSettings(
                                            symbol: 'Rp ',
                                            thousandSeparator: '.',
                                            decimalSeparator: ',',
                                            symbolAndNumberSeparator: '',
                                            fractionDigits: 0,
                                          )).output.symbolOnLeft,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Detail Lainnya'),
                                  Text('MPAN 2891u39812u312'),
                                  Text('CPAN 2813u213123'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Container(
                margin: EdgeInsets.only(top: 160),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Image.asset('images/octo.png'),
                    ),
                    Text(
                      "No Data, Let's Order With OMO RR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(''),
                  ],
                ));
          }
        });
  }
}
