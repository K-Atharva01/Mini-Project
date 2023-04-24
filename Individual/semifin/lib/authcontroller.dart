import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:semifin/usermodel.dart';


class AuthController extends GetxController{

  var myadmin = adminmodel().obs;
  var myuser = usermodel().obs;

  getUserInfo() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((event) {
      myuser.value = usermodel.fromJson(event.data()!);
    });
  }

  getAdminInfo() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('ngos')
        .doc(uid)
        .snapshots()
        .listen((event) {
          myadmin.value = adminmodel.fromJson(event.data()!);
    });
  }


}

