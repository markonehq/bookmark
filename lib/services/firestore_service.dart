import 'package:bookmark/app/app.logger.dart';
import 'package:bookmark/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final log = getLogger("FirestoreService");
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //_________________________________________________
  //
  // User Methods
  //_________________________________________________
  Future<void> saveUserData(UserModel data) async {
    if (data.uid.isEmpty || data.email.isEmpty) {
      log.e("User data is empty, aborting save operation.");
      return;
    }
    try {
      final userDoc = await _firestore.collection('users').doc(data.uid).get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(data.uid).set(data.toJson());
        log.i("User data saved successfully for UID: ${data.uid}");
      } else {
        final existingData = userDoc.data();
        if (existingData != null && existingData['email'] == data.email) {
          log.i(
              "User data matches the current user details for UID: ${data.uid}, not updating.");
        } else {
          log.i(
              "User data already exists for UID: ${data.uid}, but email does not match.");
        }
      }
    } catch (e) {
      log.e("Error saving user data: $e");
    }
  }

  //_________________________________________________
  //
  // Bookmark Methods
  //_________________________________________________
}
