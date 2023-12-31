import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_pj/auth_page.dart';
//import 'package:flutter_project/screen/onBosrding.dart';
//import 'package:halo/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_pj/model/shop.dart';
import 'package:flutter_pj/page/cart_page.dart';
import 'package:flutter_pj/page/login_sucess_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
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
      title: 'ON BOARDING SCREEN',
      theme: ThemeData.light(useMaterial3: true),
      //home: const OnBoardingScreen(),
      //home: SignInScreen(),
      home: const AuthPage(),
      //home: SignUpScreen(),
      routes: {
        'shop_page':(context) => ShopPage(),
        'cart_page':(context) => const CartPage(),
      },
    );
  }
}

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}