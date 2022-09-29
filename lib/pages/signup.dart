import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sdp_project/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: h*0.03,),
            /*
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/loginpage.gif'),
                    )
                ),
              ),
            ),

        */
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            // SizedBox(),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Username",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: numController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Number",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                  obscureText:true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Color.fromRGBO(0, 0, 255, 1),
            //         ),
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //       labelText: "Confirm Password",
            //       labelStyle: TextStyle(
            //         fontSize: 18,
            //       ),
            //     ),
            //       obscureText:true,
            //       enableSuggestions: false,
            //       autocorrect: false,
            //   ),
            // ),
            SizedBox(
              height: h*0.04,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    final username = nameController.text;
                    final password = passwordController.text;
                    final number = numController.text;
                    final email = emailController.text;
                    print(username + " " +  number);
                    createUser(username, password, number, email);

                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30,15,30,15),
                    child: Text("Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )
                      )
                  )
              ),
            ),
            SizedBox(height: 70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }

  Future createUser(String username, String password, String number, String email) async{
    final fbcol = FirebaseFirestore.instance.collection("users").doc();
    final user = User(int.parse(number), username, password, email);

    final json = user.toJson();
    await fbcol.set(json);

  }
}