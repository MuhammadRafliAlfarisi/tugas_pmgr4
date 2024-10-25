import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'No Faktur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No Faktur harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Penjualan'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Customer'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jumlah Barang'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Total Penjualan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Data berhasil disimpan')),
                    );
                  }
                },
                child: Text('Simpan'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman Home
                },
                child: Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
