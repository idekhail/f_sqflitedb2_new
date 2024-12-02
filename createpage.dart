import 'package:f_sqflitedb2_new/json1/sqldb.dart';
import 'package:flutter/material.dart';

import 'package:f_sqflitedb2_new/json1/users.dart';

class CreatePage extends StatefulWidget{
  @override
  State<CreatePage> createState()=> _CreateState() ;
}

class _CreateState extends State<CreatePage>{
  final userController = TextEditingController();
  final passController = TextEditingController();
  bool isChecked = false;
  bool isLoginTrue = false;
  //final db = SqlDb();

  insertUser() async{
    if(userController.text.isNotEmpty ) {
      var response = await SqlDb.instance.createUser(
          Users(username: userController.text, password: passController.text));
      if (response > 0) {
        Navigator.pop(context);
      } else {
        AlertDialog(title: Text("Error"));
      }
    }else{
      const AlertDialog(title: Text("Empty"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Create Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
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
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: () async{
                      insertUser();
                    },
                    child: const Text("Insert User",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  // Spacer(flex: 1),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () async{
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel",
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