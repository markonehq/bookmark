import 'package:bookmark/model/user.dart';
import 'package:bookmark/services/firestore_service.dart';
import 'package:bookmark/services/local_storage_service.dart';
import 'package:bookmark/utils/file_exporter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final _log = getLogger("AuthService");
  final _pref = locator<LocalStorageService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // Get the current user
  User? get currentUser => _firebaseAuth.currentUser;

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      _log.d("User signed out");
      _pref.clear();
    } catch (e) {
      _log.e("Error signing out: $e");
    }
  }

  // Google sign-in
  Future<bool> signInWithGoogle() async {
    try {
      _log.d("Starting Google sign-in process");

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        _log.d("Google sign-in was cancelled by user");
        return false;
      }

      _log.d("Google sign-in successful, getting authentication");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      _log.d("Creating credential with Google auth tokens");
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _log.d("Signing in to Firebase with Google credential");
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        _log.e("User is null after Google sign-in");
        return false;
      }

      _log.d("Firebase authentication successful for user: ${user.uid}");

      // Check if the user is new
      bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? true;
      _pref.write('isNewUser', isNewUser);

      // Create a new user in Firestore if it's a new user
      if (isNewUser) {
        _log.d("Creating new user in Firestore");
        final userModel = UserModel(
          uid: user.uid,
          email: user.email ?? '',
          name: user.displayName ?? '',
          avatar: user.photoURL ?? '',
        );
        await _firestoreService.saveUserData(userModel);
      }

      // Save user data to local storage
      _pref.write('uid', user.uid);
      _pref.write('email', user.email);
      _pref.write('name', user.displayName);
      _pref.write('avatar', user.photoURL);
      _pref.write('isNewUser', isNewUser);

      _log.d("User data saved successfully");
      return true;
    } catch (e, stack) {
      _log.e("Error during Google sign-in: $e");
      _log.e("Stack trace: $stack");
      return false;
    }
  }
}
