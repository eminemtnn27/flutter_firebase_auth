import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  Future<User?> SignIn(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  SignOut() async {
    return await auth.signOut();
  }

  Future<User?> createPerson(String name, String email, String password) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _fire
        .collection("Person")
        .doc(user.user?.uid)
        .set({'username': name, 'email': email});
    return user.user;
  }
}
