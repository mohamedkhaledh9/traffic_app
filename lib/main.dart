import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:traffic/screens/adminscreens/add_car_info_screen.dart';
import 'package:traffic/screens/adminscreens/admin_login_screen.dart';
import 'package:traffic/screens/home_page.dart';
import 'package:traffic/screens/userscreens/login_screen.dart';
import 'package:traffic/screens/userscreens/owner_car_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        AdminLoginScreen.id: (context) => AdminLoginScreen(),
        AddCarInfo.id: (context) => AddCarInfo(),
        OwnerCarScreen.id: (context) => OwnerCarScreen(),
        LoginSCreen.id: (context) => LoginSCreen(),
      },
    );
  }
}
