import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  Future<void> reauthenticateUser(String email, String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user?.reauthenticateWithCredential(credential);
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<void> updateUserEmail(String newEmail) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updateEmail(newEmail);
        await user.reload();
      } else {}
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<void> UpdateUserPassword(String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updatePassword(password);
        await user.reload();
      } else {}
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<bool> changeEmail({
    required String currentEmail,
    required String password,
    required String newEmail,
  }) async {
    try {
      await reauthenticateUser(currentEmail, password);
      await updateUserEmail(newEmail);
      return true;
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<bool> changePhoneNumber({
    required String token,
    required String newPhoneNumber,
    required String newEmail,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'phoneNumber': newPhoneNumber,
        'email': newEmail,
      });
      return true;
    } catch (e) {
      throw new Exception(e);
    }
  }

  Future<bool> editProfile({
    required String currentEmail,
    required String password,
    required String newEmail,
    required String token,
    required String newPhoneNumber,
  }) async {
    try {
      await changeEmail(
        currentEmail: currentEmail,
        password: password,
        newEmail: newEmail,
      );

      await changePhoneNumber(
        token: token,
        newPhoneNumber: newPhoneNumber,
        newEmail: newEmail,
      );

      return true;
    } catch (e) {
      throw new Exception(e);
    }
  }
}
