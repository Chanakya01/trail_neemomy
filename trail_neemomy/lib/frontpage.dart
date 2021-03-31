import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trail_neemomy/setUp/signIn.dart';
import 'package:trail_neemomy/setUp/signUp.dart';


class Frontpage extends StatelessWidget {
  const Frontpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     // backgroundColor: const Color(0xffffffff),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/frontscreen.png"),
            fit: BoxFit.cover,
            ),  
          ),
        child: Container(
          padding: EdgeInsets.only(bottom: 40.0),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              Container(
                //color: Colors.amber,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15.0)
                ),
                child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                }, 
                child: Text(
                  "Already a user: LOGIN",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                )),
              ),
              SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15.0)
                ),
                  //color: Colors.amber,
                  child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                }, 
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white, fontSize: 24.0), 
                )),
                ),
            ],
            ),
        )
      )
    );
  }
}

