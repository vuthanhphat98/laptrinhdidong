// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'Login_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _fullnameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: _dateOfBirthController,
              decoration: const InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // X ử lý đăng ký người dùng ở đây
                Navigator.pop(context); // Quay lại màn hình đăng nhập
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}