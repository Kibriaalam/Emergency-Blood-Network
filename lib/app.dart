import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

class EmergencyBloodNetworkApp extends StatelessWidget {
  const EmergencyBloodNetworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Blood Network',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),

      home: const SplashScreen(),
    );
  }
}
