import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(159, 208, 181,1),
              Color.fromRGBO(66, 138, 157,1),
              Color.fromRGBO(159, 208, 181,1),
            ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100),
            Center(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("LOGIN", style: TextStyle(color: Colors.black54, fontSize: 50,fontWeight: FontWeight.w900,),),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                        child: Text("Welcome Back", style: TextStyle(color: Colors.black54, fontSize: 18),),
                    ),
                  ],
                ),

            ),
            SizedBox(height: 50),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                          child: Column(
                            children:[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)),),
                                    boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(66, 220, 175,0.2),
                                      blurRadius: 10,
                                      offset: Offset(0, 5)
                                  )],
                                ),
                                child: TextField(


                                    controller: _EmailController,
                                    decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,



                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(

                                    color: Colors.white,
                                    border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(66, 220, 175,0.2),
                                        blurRadius: 10,
                                        offset: Offset(0, 5)
                                    )]
                                ),
                                child: TextField(
                                  obscureText: true,
                                  controller: _PasswordController,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Container(
                          height: 55,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromRGBO(66, 138, 157,1)
                          ),

                          child: TextButton(onPressed: (){
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: _EmailController.text, password: _PasswordController.text).then((value) {
                              Navigator.pushNamed(context, 'home');}).onError((error, stackTrace) {
                              Fluttertoast.showToast(msg: "Invalid Email or Password");
                            });
                          },child: Text("GET STARTED", style: TextStyle(color: Colors.white, fontSize: 18),),),

                        ),
                      SizedBox(height: 30,),
                      TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'register');
                        }, child: Text('SignUp',style: TextStyle(color: Colors.grey))),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'forgot');
                        }, child: Text('Forget Password?',style: TextStyle(color: Colors.grey))),
                        SizedBox(height: 40,),
                        TextButton(onPressed: (){Navigator.pushNamed(context, 'home');} ,child: Text('home',style: TextStyle(color: Colors.grey)))

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        ),
      );

  }
}
