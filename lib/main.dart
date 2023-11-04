// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kadu_ngo/screens/splash/splash.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen()
        // initialRoute: '/',
        // onGenerateRoute: RouteGenerator().generateRoute,
        );
  }
}
