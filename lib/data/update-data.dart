import 'package:flutter/material.dart';

class UpdatePenjualanPage extends StatefulWidget {
  final List<Map<String, dynamic>> dataPenjualan;
  final Function(Map<String, dynamic>, int) onUpdate;

  const UpdatePenjualanPage({
    Key? key,
    required this.dataPenjualan,
    required this.onUpdate,
  }) : super(key: key);

  @override
  _UpdatePenjualanPageState createState() => _UpdatePenjualanPageState();
}

class _UpdatePenjualanPageState extends State<UpdatePenjualanPage> {
  final _namaCustomerController = TextEditingController();
  final _jumlahBarangController = TextEditingController();
  final _totalPenjualanController = TextEditingController();

  Map<String, dynamic>? _selectedData;
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data Penjualan'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaCustomerController,
              decoration: const InputDecoration(labelText: "Nama Customer"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchData,
              child: const Text('Cari Data'),
            ),
            const SizedBox(height: 20),
            if (_selectedData != null) ...[
              TextField(
                controller: _jumlahBarangController,
                decoration: const InputDecoration(labelText: "Jumlah Barang"),
              ),
              TextField(
                controller: _totalPenjualanController,
                decoration: const InputDecoration(labelText: "Total Penjualan"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateData,
                child: const Text('Update Data'),
              ),
            ]
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mencari data berdasarkan nama customer
  void _searchData() {
    String namaCustomer = _namaCustomerController.text;
    int index = widget.dataPenjualan.indexWhere(
        (element) => element['namaCustomer'].toString().toLowerCase() == namaCustomer.toLowerCase());

    if (index != -1) {
      setState(() {
        _selectedData = widget.dataPenjualan[index];
        _selectedIndex = index;
        _jumlahBarangController.text = _selectedData!['jumlahBarang'].toString();
        _totalPenjualanController.text = _selectedData!['totalPenjualan'].toString();
      });
    } else {
      // Jika data tidak ditemukan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data tidak ditemukan")),
      );
    }
  }

  // Fungsi untuk mengupdate data penjualan
  void _updateData() {
    if (_selectedIndex != null) {
      int jumlahBarang = int.parse(_jumlahBarangController.text);
      double totalPenjualan = double.parse(_totalPenjualanController.text);

      Map<String, dynamic> updatedData = {
        'noFaktur': _selectedData!['noFaktur'],
        'tanggalPenjualan': _selectedData!['tanggalPenjualan'],
        'namaCustomer': _selectedData!['namaCustomer'],
        'jumlahBarang': jumlahBarang,
        'totalPenjualan': totalPenjualan,
      };

      // Panggil callback untuk mengupdate data di halaman utama
      widget.onUpdate(updatedData, _selectedIndex!);

      // Kembali ke halaman sebelumnya
      Navigator.of(context).pop();
    }
  }
}
