import 'package:flutter/material.dart';
import 'package:project_baru/pages/home_screen.dart';
import 'package:project_baru/pages/auth/login_screen.dart';
import 'package:project_baru/services/auth_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Example',
      home: AuthCheck(),
    );
  }
}

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final AuthService _authService = AuthService();
  late Future<bool> _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = _authService.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData && snapshot.data == true) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:project_baru/pages/doa/list_doa_screen.dart';
// import 'package:project_baru/pages/home_screen.dart';
// import 'package:project_baru/pages/auth/login_screen.dart';
// import 'package:project_baru/services/auth_services.dart';
// import 'package:project_baru/pages/posts/list_post_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:Scaffold(
//         appBar: AppBar(title: Text('Fetch Data')),
//         body:  isLoggedIn ? HomeScreen() : LoginScreen(),
//       ),
//     );
//   }
// }