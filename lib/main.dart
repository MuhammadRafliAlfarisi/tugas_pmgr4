import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login.dart';
import 'package:flutter_application_1/data/add-data.dart';
import 'package:flutter_application_1/data/update-data.dart';
import 'package:flutter_application_1/data/view-data.dart'; // Import PenjualanForm

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Deklarasi list untuk menyimpan data penjualan
  List<Map<String, dynamic>> dataPenjualan = [];

  String? loggedInName;
  String? loggedInNpm;
  String? loggedInClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management System'),
        backgroundColor: Colors.blue,
        actions: [
          if (loggedInName == null &&
              loggedInNpm == null &&
              loggedInClass == null)
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                // Navigasi ke halaman login
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      onLogin: (name, npm, kelas) {
                        setState(() {
                          loggedInName = name;
                          loggedInNpm = npm;
                          loggedInClass = kelas;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          if (loggedInName != null &&
              loggedInNpm != null &&
              loggedInClass != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                      'Welcome, $loggedInName! (NPM: $loggedInNpm, Kelas: $loggedInClass)')),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: <Widget>[
                  buildMenuItem(
                    icon: Icons.dashboard,
                    title: 'Dashboard',
                    color: Colors.blue,
                    onTap: () {
                      // Navigasi ke halaman DataPenjualanPage ketika dashboard diklik
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DataPenjualanPage(
                            dataPenjualan: dataPenjualan,
                          ),
                        ),
                      );
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.add,
                    title: 'Add',
                    color: Colors.red,
                    onTap: () {
                      // Navigasi ke form tambah data
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PenjualanForm(
                            onSubmit: (newData) {
                              setState(() {
                                // Simpan data penjualan dan update state
                                dataPenjualan.add(newData);
                              });

                              // Tampilkan data yang disimpan ke terminal
                              print("Data berhasil disimpan: $newData");
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.update,
                    title: 'Update',
                    color: Colors.green,
                    onTap: () {
                      // Navigasi ke halaman UpdatePenjualanPage
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpdatePenjualanPage(
                            dataPenjualan: dataPenjualan,
                            onUpdate: (updatedData, index) {
                              setState(() {
                                dataPenjualan[index] = updatedData;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  buildMenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      color: Colors.grey,
                      onTap: () {
                        // Handle logout action
                        setState(() {
                          // Menghapus data nama, NPM, dan kelas
                          loggedInName = null;
                          loggedInNpm = null;
                          loggedInClass = null;
                        });

                        // Navigasi kembali ke halaman login
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              onLogin: (name, npm, kelas) {
                                setState(() {
                                  loggedInName = name;
                                  loggedInNpm = npm;
                                  loggedInClass = kelas;
                                });
                              },
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tampilkan tabel data penjualan
            // Expanded(
            //   child: DataPenjualanTable(dataPenjualan: dataPenjualan),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required Color color,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// // Widget untuk menampilkan tabel data penjualan
// class DataPenjualanTable extends StatelessWidget {
//   final List<Map<String, dynamic>> dataPenjualan;

//   const DataPenjualanTable({Key? key, required this.dataPenjualan})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         columns: const [
//           DataColumn(label: Text('No Faktur')),
//           DataColumn(label: Text('Tanggal Penjualan')),
//           DataColumn(label: Text('Nama Customer')),
//           DataColumn(label: Text('Jumlah Barang')),
//           DataColumn(label: Text('Total Penjualan')),
//         ],
//         rows: dataPenjualan.map((penjualan) {
//           return DataRow(cells: [
//             DataCell(Text(penjualan['noFaktur'])),
//             DataCell(Text(penjualan['tanggalPenjualan'])),
//             DataCell(Text(penjualan['namaCustomer'])),
//             DataCell(Text(penjualan['jumlahBarang'].toString())),
//             DataCell(Text(penjualan['totalPenjualan'].toString())),
//           ]);
//         }).toList(),
//       ),
//     );
//   }
// }
