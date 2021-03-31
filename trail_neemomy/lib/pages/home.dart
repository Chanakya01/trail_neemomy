import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trail_neemomy/database/database.dart';

class Home extends StatefulWidget {
  final UserCredential user;
  Home({Key key,this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DataBaseMethods db = new DataBaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text(db.getUserByUseremail(widget.user.user.email).toString()),
        ),
      )
    );
  }
}