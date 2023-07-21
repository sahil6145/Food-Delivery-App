import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Data/menuList.dart';
import 'package:food_app/pages/Home.dart';
import 'package:food_app/pages/Login/login.dart';
import 'package:food_app/pages/seeMore.dart';
import 'package:food_app/pages/welcome.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Bottom())),
        ChangeNotifierProvider(create: ((context) => Listprovider()))
      ],
      child: MaterialApp(
        home: (FirebaseAuth.instance.currentUser != null) ? Home() : Login(),
      ),
    );
  }
}
