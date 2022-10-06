import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdp_project/controllers/auth_controller.dart';
import 'package:sdp_project/pages/loading.dart';
import 'package:sdp_project/pages/login.dart';
import 'package:sdp_project/pages/main.dart';
import 'package:sdp_project/pages/signup.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  loginCred();
  await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      // home:MyApp(),
    initialRoute: '/mainPage',
    routes: {
        '/loading':(context)=>Loading(),
        '/login': (context)=>Login(),
        '/signup': (context)=>SignUp(),
        '/mainPage': (context)=>MainPage(),
    },
  ));
}

void loginCred() async{
  final storage = new FlutterSecureStorage();
  dynamic value = await storage.read(key : "username");
  print(value);
}
