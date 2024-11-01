import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function(String, String, String) onLogin; // Callback untuk mengirimkan nama, npm, dan kelas

  const LoginPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _npmController = TextEditingController();
  final _classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _npmController,
              decoration: const InputDecoration(labelText: "NPM"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _classController,
              decoration: const InputDecoration(labelText: "Kelas"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitLogin() {
    String name = _nameController.text;
    String npm = _npmController.text;
    String kelas = _classController.text;

    // Kirim nama, npm, dan kelas ke halaman utama
    widget.onLogin(name, npm, kelas);

    // Kembali ke halaman utama setelah login berhasil
    Navigator.of(context).pop();
  }
}
