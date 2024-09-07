import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyper_ui/core.dart'; // Jika menggunakan Cloud Firestore

String? get token => DBService.get("token");
String? get name => DBService.get("name");
String? get role => DBService.get("role");

bool get isAdmin => role == "admin";
bool get isUser => role == "user";

bool get isLoggedIn => token == null;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user?.uid).get();

      if (userDoc.exists) {
        String role = userDoc.get('role') as String;
        String name = userDoc.get('name') as String;
        String phoneNumber = userDoc.get('phoneNumber') as String;
        String? token = user?.refreshToken;

        DBService.set("name", name);
        DBService.set("role", role);
        DBService.set("token", token!);
        DBService.set("phoneNumber", phoneNumber);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw new Exception(e);
    }
    return false;
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();

      DBService.clear("name");
      DBService.clear("role");
      DBService.clear("token");
      return true;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    } catch (e) {
      throw new Exception(e);
    }
  }

  // ... (Implementasi untuk sign up, sign out, dll.)

  Future<void> registerUser(String email, String password, String role) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      await _firestore.collection('users').doc(user!.uid).set({
        'email': email,
        'role': role,
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
