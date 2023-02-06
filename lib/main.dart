import 'package:firebase_chat/firebase_options.dart';
import 'package:firebase_chat/helper/helper_function.dart';
import 'package:firebase_chat/pages/auth/login_page.dart';
import 'package:firebase_chat/pages/home_page.dart';
import 'package:firebase_chat/shared/contants.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: Constants.apiKey,
          appId: Constants.appId,
          messagingSenderId: Constants.messagingSenderId,
          projectId: Constants.projectId),
    );
  } else {
    await Firebase.initializeApp();
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //FirebaseOptions
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLogginInStatus();
  }

  getUserLogginInStatus() async {
    await HelperFunctions.getUserLogginInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants(). primarycolor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
