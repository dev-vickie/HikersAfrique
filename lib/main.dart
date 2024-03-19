// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hikersafrique/firebase_options.dart';
import 'package:hikersafrique/models/client.dart';
import 'package:hikersafrique/models/event.dart';
import 'package:hikersafrique/screens/event_manager/event_manager_home.dart';
import 'package:hikersafrique/screens/finance%20transactions/payment_page.dart';
import 'package:hikersafrique/screens/home/wrapper.dart';
import 'package:hikersafrique/services/auth.dart';
import 'package:hikersafrique/services/auth_notifier.dart';
import 'package:provider/provider.dart';

import 'package:hikersafrique/constants/constants.dart';
import 'package:hikersafrique/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HikersAfriqueApp());
}

class HikersAfriqueApp extends StatefulWidget {
  const HikersAfriqueApp({super.key});

  @override
  State<HikersAfriqueApp> createState() => _HikersAfriqueAppState();
}

class _HikersAfriqueAppState extends State<HikersAfriqueApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthNotifier(),
      child: StreamProvider<Client?>.value(
        initialData: null,
        value: AuthService().auth,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HikersAfrique App',
          theme: ThemeData(
              scaffoldBackgroundColor: kScaffoldBgColor,
              fontFamily: 'Cera-Pro'),
          routes: {
            '/': (context) => const Wrapper(),
            '/welcome': (context) => const WelcomeScreen(),
          },
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF481E4D),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('lipa'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF481E4D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              // Navigator.push(context,
              // MaterialPageRoute(builder: (context) => PaymentPage(event:event ),));
            },
            child: const Text(
              ' payment',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
