import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class Auth{
late User kulanici;
  final _firebaseAuth=FirebaseAuth.instance;

  Future<User?> signInAnonymously()async{
final userCredentials= await _firebaseAuth.signInAnonymously();

return userCredentials.user;

  }
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.applicationId);
final UserData= await FacebookAuth.instance.getUserData();
var Useremail=UserData['email'];
    // Once signed in, return the UserCredential
    return _firebaseAuth.signInWithCredential(facebookAuthCredential);

  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredentials.user;
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredentials;
  }
  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    if (googleUser !=null) {
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(
          credential);
      return userCredential.user;
    }
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> authStatus() {
    return _firebaseAuth.authStateChanges();
  }


}