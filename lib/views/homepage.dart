// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gms_cloud/core/bloc/suratJalan_bloc/suratjalan_bloc.dart';
import 'package:gms_cloud/core/utils/sharedpref.dart';
import 'package:gms_cloud/splashScreen.dart';
import 'package:gms_cloud/views/detailspage.dart';
import 'package:gms_cloud/widget/widget.dart';

class HomePage extends StatefulWidget {
  final String? nama;

  const HomePage({Key? key, this.nama}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? keterangan;
  @override
  void initState() {
    SuratjalanBloc suratjalanBloc =
        BlocProvider.of<SuratjalanBloc>(context, listen: false);
    suratjalanBloc.add(SuratJalanAksi());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.nama!,
                    style: TextStyle(color: Color(0xffA7A7A7), fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.logout_sharp,
                    color: Color(0xffA7A7A7),
                  ),
                ],
              ),
            ),
            itemBuilder: (_) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                value: 'logout',
                child: const Text('Logout'),
                onTap: () async {
                  await StorageManager.setLogout();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _cardList(),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<SuratjalanBloc, SuratjalanState> _cardList() {
    return BlocBuilder<SuratjalanBloc, SuratjalanState>(
      builder: (context, state) {
        if (state is SuratJalanWaiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuratJalanError) {
          return Center(
            child: Text("Data Error"),
          );
        }
        if (state is SuratJalanFalse) {
          return Center(
            child: Text("Tidak ada Surat Jalan"),
          );
        }
        if (state is SuratJalanLoaded) {
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.suratJalanRespone?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              if (state.suratJalanRespone!.data![index].tTBK == "driver") {
                // ignore: unused_local_variable
                keterangan = "Menunggu Verifikasi";
              } else {
                // ignore: unused_local_variable
                keterangan = "Dalam Proses";
              }
              return InkWell(
                onTap: () {
                  if (state.suratJalanRespone?.data?[index].tTBK == "driver") {
                    Fluttertoast.showToast(msg: "Menunggu Verifikasi Panggung");
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  nomorSuratJalanId: state.suratJalanRespone
                                      ?.data?[index].sURATJALANID,
                                  suratJalanNomor: state.suratJalanRespone
                                      ?.data?[index].sURATJALANNOMOR,
                                  nama: widget.nama,
                                )));
                  }
                },
                child: GSMCardList(
                  text1: state.suratJalanRespone?.data?[index].sURATJALANNOMOR,
                  text2: state.suratJalanRespone?.data?[index].nAMA,
                  text3: state.suratJalanRespone?.data?[index].tANGGAL,
                  text4: keterangan,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  Container _header() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Surat Jalan',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
