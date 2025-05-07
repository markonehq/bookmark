import 'package:bookmark/app/app.logger.dart';
import 'package:bookmark/model/user_model.dart';
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
    try {
      await _firestore.collection('users').doc(data.uid).set(data.toJson());
      log.i("User data saved successfully for UID: ${data.uid}");
    } catch (e) {
      log.e("Error saving user data: $e");
    }
  }


  //_________________________________________________
  //
  // Bookmark Methods
  //_________________________________________________
}
