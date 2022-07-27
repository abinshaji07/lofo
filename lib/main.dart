// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flower_selling_app/firebase_options.dart';
import 'package:flower_selling_app/home/screens/buy/location.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';

import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // runApp( MaterialApp(
  //   home: CardPicture(),
  // ),
  // );
   runApp(const MyApp());
}
