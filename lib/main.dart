// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kadu_ngo/providers/router_provider.dart';
import 'package:kadu_ngo/screens/otp/otp.dart';
import 'package:kadu_ngo/screens/signin/signin.dart';
import 'package:kadu_ngo/screens/splash/splash.dart';

void main() {
  runApp(const ProviderScope(child: HotelBookingApp()));
}

class HotelBookingApp extends ConsumerWidget {
  const HotelBookingApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Auth Riverpod GoRouter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
