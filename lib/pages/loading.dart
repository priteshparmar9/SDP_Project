import 'package:flutter/material.dart';

import 'login.dart';

class Loading extends StatefulWidget {
  // const Loadind({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Air Liners"),
      ),
      body:
      Center(
        child: Image(
          image: AssetImage('assets/images/Gif1.gif'),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: Text("Login"),
      ),
    );
  }
}
