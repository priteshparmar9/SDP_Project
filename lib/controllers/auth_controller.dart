import 'package:sdp_project/pages/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../pages/login.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);

  }

  _initialScreen(User? user){
    if(user==null){
      Get.offAll(()=>Login());
    }
    else{
      Get.offAll(()=>Loading());
    }
  }

  void Register(String email, password){
    try{
      auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About user", "User message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text("Account Creation Failed"),
        messageText: Text(
          e.toString()
        )
      );
    }
  }

  void SignIn(String email, password){
    try{
      auth.signInWithEmailAndPassword(email: email, password: password);
    }
    catch(e){
      Get.snackbar("About Login", "User message",
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text("Login Failed"),
          messageText: Text(
              e.toString()
          )
      );
    }
  }

  void Logout() async{
    await auth.signOut();
  }


}