import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyForgot extends StatefulWidget {
  const MyForgot({super.key});

  @override
  State<MyForgot> createState() => _MyForgotState();
}

class _MyForgotState extends State<MyForgot> {
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
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 130),
            Center(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("FORGOT PASSWORD", style: TextStyle(color: Colors.black54, fontSize: 30,fontWeight: FontWeight.w900,),),

                ],
              ),

            ),
            SizedBox(height: 80),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
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
                                  border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
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
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),

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
                            FirebaseAuth.instance.sendPasswordResetEmail(email: _EmailController.text).then((value){
                              Fluttertoast.showToast(msg: "We have send you email to recover password");
                            }).onError((error, stackTrace) {Fluttertoast.showToast(msg: "Error ${error.toString()}");});
                          },child: Text("FORGOT", style: TextStyle(color: Colors.white, fontSize: 18),),),

                        ),



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
