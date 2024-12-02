
import 'package:f_sqflitedb2_new/loginpage.dart';
import 'package:f_sqflitedb2_new/showpage.dart';
import 'package:f_sqflitedb2_new/json1/sqldb.dart';
import 'package:flutter/material.dart';

import 'package:f_sqflitedb2_new/json1/users.dart';

class UpdatePage extends StatelessWidget {
// final db = SqlDb();
  final userController = TextEditingController();
  final passController = TextEditingController();

  Users user;
  UpdatePage({required this.user});

  updateU() async{
    user.username = userController.text.toString();
    user.password = passController.text.toString();
    // print(this.usr.username);
    var response = await SqlDb.instance.updateUser(user);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Update Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 109, 5),
        child: Column(
          children: <Widget>[

            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.blue[900]!,
                ),
              ),
            ),

            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: userController,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(hintText: '${user.username}'),
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                controller: passController,
                style: const TextStyle(fontSize: 22),
                decoration: InputDecoration(hintText: '${user.password}'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              color: const Color.fromARGB(100, 100, 19, 5),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // use whichever suits your need
                children: [
                  //const Padding(padding: EdgeInsets.all(30)),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.purple,
                    textColor: Colors.white,
                    onPressed: () async {
                    //  updateU();
                      user.username = userController.text.toString();
                      user.password = passController.text.toString();

                     await SqlDb.instance.updateUser(user);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: const Text(
                      "Update",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      await SqlDb.instance.deleteUser(user);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.limeAccent,
                    textColor: Colors.blue,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(usr: user)));
                    },
                    child: const Text(
                      "Back",
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