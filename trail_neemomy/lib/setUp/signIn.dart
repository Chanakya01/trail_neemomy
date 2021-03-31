import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trail_neemomy/pages/home.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
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
                        height: 40.0,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.amber,
                        onPressed: signIn,
                        child: Container(child: Text("Sign In")),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e);
      }
    }
  }
}
