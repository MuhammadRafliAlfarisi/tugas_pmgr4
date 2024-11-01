import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import fluttertoast

class PenjualanForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;

  const PenjualanForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _PenjualanFormState createState() => _PenjualanFormState();
}

class _PenjualanFormState extends State<PenjualanForm> {
  final _noFakturTextboxController = TextEditingController();
  final _tanggalPenjualanTextboxController = TextEditingController();
  final _namaCustomerTextboxController = TextEditingController();
  final _jumlahBarangTextboxController = TextEditingController();
  final _totalPenjualanTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Tambah Penjualan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxNoFaktur(),
            _textboxTanggalPenjualan(),
            _textboxNamaCustomer(),
            _textboxJumlahBarang(),
            _textboxTotalPenjualan(),
            _tombolSimpan()
          ],
        ),
      ),
    );
  }

  _textboxNoFaktur() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Faktur Penjualan"),
      controller: _noFakturTextboxController,
    );
  }

  _textboxTanggalPenjualan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Penjualan"),
      controller: _tanggalPenjualanTextboxController,
    );
  }

  _textboxNamaCustomer() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Customer"),
      controller: _namaCustomerTextboxController,
    );
  }

  _textboxJumlahBarang() {
    return TextField(
      decoration: const InputDecoration(labelText: "Jumlah Barang"),
      controller: _jumlahBarangTextboxController,
    );
  }

  _textboxTotalPenjualan() {
    return TextField(
      decoration: const InputDecoration(labelText: "Total Penjualan"),
      controller: _totalPenjualanTextboxController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          String noFaktur = _noFakturTextboxController.text;
          String tanggalPenjualan = _tanggalPenjualanTextboxController.text;
          String namaCustomer = _namaCustomerTextboxController.text;
          int jumlahBarang = int.parse(_jumlahBarangTextboxController.text);
          double totalPenjualan =
              double.parse(_totalPenjualanTextboxController.text);

          // Buat map data baru
          Map<String, dynamic> newData = {
            "noFaktur": noFaktur,
            "tanggalPenjualan": tanggalPenjualan,
            "namaCustomer": namaCustomer,
            "jumlahBarang": jumlahBarang,
            "totalPenjualan": totalPenjualan,
          };

          // Kirim data baru ke callback onSubmit
          widget.onSubmit(newData);

          // Menampilkan notifikasi sukses
          Fluttertoast.showToast(
            msg: "Data berhasil disimpan!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          // Kembali ke halaman utama
          Navigator.of(context).pop();
        },
        child: const Text('Simpan'));
  }
}
