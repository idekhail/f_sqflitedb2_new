import 'package:f_sqflitedb2_new/loginpage.dart';
import 'package:f_sqflitedb2_new/json1/sqldb.dart';
import 'package:f_sqflitedb2_new/updatepage.dart';
import 'package:flutter/material.dart';

import 'json1/users.dart';

class ShowPage extends StatelessWidget {
  //final db = SqlDb();
  final userController = TextEditingController();
  final passController = TextEditingController();
  Users usr;

  ShowPage({super.key, required this.usr});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: const Text('Show Page'),
      ),
      body: Container(
        color: const Color.fromARGB(100, 100, 80, 5),
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 10),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Text(
                    '${usr.id}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[900]!,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${usr.username}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[900]!,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '${usr.password}',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue[900]!,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(10),
              color: const Color.fromARGB(100, 100, 19, 5),
              padding: EdgeInsets.all(10),
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => UpdatePage(user: usr)));
                    },
                    child: const Text(
                      "Update Page",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.all(10),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),

            //==== Show All Users  ==========
            Container(
              color: Colors.black38,
              height: double.maxFinite,
              child: FutureBuilder<List<Users>>(
                  future: SqlDb.instance.getAllUsers(),
                  builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot){
                    if( !snapshot.hasData){
                      return const Center(child: CircularProgressIndicator());
                    }else {
                      if( snapshot.data!.isEmpty){
                        return const Center(child: Text('No Records Found'));
                      }else{
                        List<Users> users = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index){
                                Users s = users[index];
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                            color: Colors.red[100],
                                            borderRadius: BorderRadius.circular(16.0)
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(s.id.toString()),
                                            Spacer(),
                                            Text(s.username),
                                            Spacer(),
                                            Text(s.password),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //const SizedBox(width: 16.0,),
                                  ],
                                );
                              }),
                        );
                      }
                    }
                  }),
            ),
            //=================================
          ],
        ),
      ),
    );
  }
}