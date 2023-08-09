import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:noteapp/listeleme.dart';



import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOTE APP',
      theme: ThemeData(
       
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home:  const ListelemePage(),
    );
  }
}

