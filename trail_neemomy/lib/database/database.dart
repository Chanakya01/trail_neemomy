import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  getUserByUseremail(String useremail) async {
    return await FirebaseFirestore.instance  .collection("users")
        .where("email", isEqualTo: useremail)
        .get();
  }

  uploadUserInfo(String userName,String userEmail) {
    // ignore: return_of_invalid_type_from_catch_error
    FirebaseFirestore.instance
        .collection("users")
        .add({
          "name" : userName,
          "email" : userEmail
    });
  }
}

/*
    FirebaseFirestore.instance
        .collection("users")
        .add(userMap)
        .catchError((error) {
      print(error.toString());
    });
*/
