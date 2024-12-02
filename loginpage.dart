import 'package:f_sqflitedb2_new/homepage.dart';
import 'package:f_sqflitedb2_new/json1/sqldb.dart';
import 'package:f_sqflitedb2_new/showpage.dart';
import 'package:flutter/material.dart';

import 'package:f_sqflitedb2_new/json1/users.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _HomeState() ;
}

class _HomeState extends State<LoginPage>{
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isChecked = false;
  bool isLoginTrue = false;
  //final db = SqlDb();


  login() async{
    var user = await SqlDb.instance.loginUser(Users(username: userController.text, password: passController.text));
    if(user != null){
      if(!mounted) return;
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(usr: user)));
    }else{
      setState(() {
        isLoginTrue = true;
        const AlertDialog(title: Text("Error", style: TextStyle(backgroundColor: Colors.green),));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Login Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: passController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              color: const Color.fromARGB(100, 100, 19, 5),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // use whichever suits your need
                children: [
                  //const Padding(padding: EdgeInsets.all(30)),
                  // Spacer(flex: 1),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async{
                      login();
                    },
                    child: const Text("Login",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: const Text("Home Page",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}