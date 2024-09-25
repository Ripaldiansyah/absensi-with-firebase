import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hyper_ui/core.dart'; // Jika menggunakan Cloud Firestore

String? get token => DBService.get("token");
String? get name => DBService.get("name");
String? get role => DBService.get("role");

bool get isAdmin => role == "admin";
bool get isUser => role == "user";

bool get isLoggedIn => token == null;
Future getCurrentId() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid.toString();
  } catch (e) {
    throw Exception(e);
  }
}

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
      if (user == null) {
        throw Exception("User is null after login");
      }

      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        String role = userDoc.get('role') as String;
        String name = userDoc.get('name') as String;
        String idEmployee = userDoc.get('idEmployee') as String;
        String phoneNumber = userDoc.get('phoneNumber') as String;
        String status = userDoc.get('statusAccount') as String;
        String? token = await user.getIdToken();
        if (token == null) {
          throw Exception("Token is null after login");
        }
        DBService.set("name", name);
        DBService.set("role", role);
        DBService.set("token", token);
        DBService.set("phoneNumber", phoneNumber);
        DBService.set("idEmployee", idEmployee);

        bool isEnabled = status == "enable" ? true : false;
        return isEnabled;
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

  Future<Map<String, dynamic>?> registerUser(
      Map<String, dynamic> userData) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userData["email"],
        password: userData["password"],
      );
      User? user = userCredential.user;

      await _firestore.collection('users').doc(user!.uid).set({
        'name': userData["name"],
        'userId': user.uid,
        'role': userData["role"],
        'email': userData["email"],
        'phoneNumber': userData["phoneNumber"],
        'idEmployee': userData["idEmployee"],
        'statusAccount': "enable",
      });

      return await getUserById(user.uid);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw new Exception(e.message);
    }
  }

  Future<Map<String, dynamic>?> updateProfile(
      Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(userData["userId"]).update({
        'name': userData["name"],
        'role': userData["role"],
        'phoneNumber': userData["phoneNumber"],
      });

      return await getUserById(userData["userId"]);
    } on FirebaseAuthException catch (e) {
      print(e);
      throw new Exception(e.message);
    }
  }

  Future<bool> deleteAccount(Map<String, dynamic> userData) async {
    try {
      await _firestore.collection('users').doc(userData["userId"]).delete();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      throw new Exception(e.message);
    }
  }
}
