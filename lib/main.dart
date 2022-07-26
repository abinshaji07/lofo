// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flower_selling_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}
