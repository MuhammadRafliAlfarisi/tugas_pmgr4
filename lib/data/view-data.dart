import 'package:flutter/material.dart';

// Halaman baru untuk menampilkan data penjualan
class DataPenjualanPage extends StatelessWidget {
  final List<Map<String, dynamic>> dataPenjualan;

  const DataPenjualanPage({Key? key, required this.dataPenjualan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No Faktur')),
            DataColumn(label: Text('Tanggal Penjualan')),
            DataColumn(label: Text('Nama Customer')),
            DataColumn(label: Text('Jumlah Barang')),
            DataColumn(label: Text('Total Penjualan')),
            DataColumn(label: Text('Aksi')),
          ],
          rows: dataPenjualan.map((penjualan) {
            return DataRow(cells: [
              DataCell(Text(penjualan['noFaktur'])),
              DataCell(Text(penjualan['tanggalPenjualan'])),
              DataCell(Text(penjualan['namaCustomer'])),
              DataCell(Text(penjualan['jumlahBarang'].toString())),
              DataCell(Text(penjualan['totalPenjualan'].toString())),
              DataCell(
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDataPenjualanPage(
                          dataPenjualan: penjualan,
                        ),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail'),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

// Halaman detail data penjualan
class DetailDataPenjualanPage extends StatelessWidget {
  final Map<String, dynamic> dataPenjualan;

  const DetailDataPenjualanPage({Key? key, required this.dataPenjualan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Data Penjualan'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No Faktur: ${dataPenjualan['noFaktur']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Tanggal Penjualan: ${dataPenjualan['tanggalPenjualan']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Customer: ${dataPenjualan['namaCustomer']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Jumlah Barang: ${dataPenjualan['jumlahBarang']}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Penjualan: ${dataPenjualan['totalPenjualan']}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
