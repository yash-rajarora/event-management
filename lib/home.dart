import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management'),
      ),
      body: currentIndex == 0
          ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.network(
                'https://images.pexels.com/photos/2088170/pexels-photo-2088170.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
                .image,
            fit: BoxFit
                .cover, // Adjust how the image should be displayed
          ),
        ),
        child: Center(
          child:Container(height: 50,
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.orange[900]
            ),

          child: TextButton(onPressed: (){
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushNamed(context, 'login');
            });
          },child: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),),
        ),
        ),
      )
          : Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 200, 228, 148),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.settings)),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
