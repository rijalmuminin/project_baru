import 'package:flutter/material.dart';
import 'package:project_baru/services/auth_services.dart';
import 'package:project_baru/pages/home_screen.dart';
import 'package:project_baru/pages/auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController,decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, obscureText: true,decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await _authService.login(
                  emailController.text,
                  passwordController.text,
                );
                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login gagal')),
                  );
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                );
              },
              child: Text("Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
