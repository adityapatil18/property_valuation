import 'package:flutter/material.dart';
import 'package:property_valuation/View/Screens/forget_password_screen.dart';
import 'package:property_valuation/View/Screens/home_screen.dart';
import 'package:property_valuation/View/Screens/login_screen.dart';
import 'package:property_valuation/View/Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PropertyValuation());
}

class PropertyValuation extends StatelessWidget {
  const PropertyValuation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
