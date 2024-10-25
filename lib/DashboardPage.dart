import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData = [
    {
      'no_faktur': 'INV001',
      'tanggal': '2024-10-01',
      'customer': 'Customer A',
      'jumlah_barang': 10,
      'total_penjualan': 1000000,
    },
    {
      'no_faktur': 'INV002',
      'tanggal': '2024-10-02',
      'customer': 'Customer B',
      'jumlah_barang': 5,
      'total_penjualan': 500000,
    },
    {
      'no_faktur': 'INV003',
      'tanggal': '2024-10-03',
      'customer': 'Customer C',
      'jumlah_barang': 8,
      'total_penjualan': 800000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabel Penjualan'),
      ),
      body: ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          final sale = salesData[index];
          return ListTile(
            title: Text('Faktur: ${sale['no_faktur']}'),
            subtitle: Text(
                'Tanggal: ${sale['tanggal']} | Customer: ${sale['customer']}'),
            trailing: Text(
                'Jumlah Barang: ${sale['jumlah_barang']} | Total: ${sale['total_penjualan']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Kembali ke halaman Home
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
