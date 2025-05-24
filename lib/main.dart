import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rocks_music/View%20Model/viewmodel.dart';
import 'package:s_rocks_music/View/botton_navbar.dart';
import 'package:s_rocks_music/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Viewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottonNavbar(),
      ),
    );
  }
}
