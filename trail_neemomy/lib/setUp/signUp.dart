import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trail_neemomy/database/database.dart';
import 'package:trail_neemomy/pages/home.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _userName, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/neemomie_logo.png"),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty || val.length < 4
                              ? "letters is less than 6"
                              : null;
                        },
                        // controller: userNameTextEditingController,
                        decoration: InputDecoration(
                          hintText: "User name",
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: Colors.blueGrey,
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) {
                          _userName = value;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                              ? null
                              : "Provide a valid emailId";
                        },
                        //controller: emailTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          icon: Icon(
                            Icons.email,
                            color: Colors.blueGrey,
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Provide password with 6+ characters";
                        },
                        // controller: passwordTextEditingController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.security_sharp,
                            color: Colors.blueGrey,
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) {
                          _password = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      // ignore: deprecated_member_use

                      RaisedButton(
                        color: Colors.amber,
                        onPressed: signUp,
                        child: Container(child: Text("Sign Up")),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    final _form = _formKey.currentState;
    DataBaseMethods db = new DataBaseMethods();
    if (_form.validate()) {
      _form.save();
    
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        db.uploadUserInfo(_userName,_email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e);
      }
    }
  }
}
