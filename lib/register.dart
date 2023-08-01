import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
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
                  Color.fromRGBO(66, 220, 175,1),
                  Color.fromRGBO(38, 220, 147,1),
                  Color.fromRGBO(39, 219, 111,1),
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100,),
            Center(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("SignUp", style: TextStyle(color: Colors.black54, fontSize: 50,fontWeight: FontWeight.w900),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                      child:Text("Welcome", style: TextStyle(color: Colors.black54, fontSize: 18),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
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
                        SizedBox(height: 40,),
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
                                      hintText: "Confirm Password",
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
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromRGBO(66, 220, 175,1)
                          ),
                          child: Center(

                            child: Center(
                              child: TextButton(onPressed: (){
                                FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: _EmailController.text,
                                    password: _PasswordController.text
                                ).then((value) {
                                  Navigator.pushNamed(context, 'home');
                                }).onError((error, stackTrace) {
                                  print("Error ${error.toString()}");
                                });


                              },child: Text("Signup", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'login');
                        }, child: Text('Already have an account??',style: TextStyle(color: Colors.grey))),


                        SizedBox(height: 50,),
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
