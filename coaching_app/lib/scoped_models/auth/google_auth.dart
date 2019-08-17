import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

mixin GoogleAuth on Model {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  GoogleSignInAuthentication GSAuth;

  Future<FirebaseUser> SignInWithGoogleAuth() async {
    print("1");
    GoogleSignInAccount GSA = await _googleSignIn.signIn();
    print("2");
     GSAuth = await GSA.authentication;
    print("3");
     AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: GSAuth.accessToken,
      idToken: GSAuth.idToken,
    );
    print("4");
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("5");
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    print("6");
    final FirebaseUser currentUser = await _auth.currentUser();
    print("7");
    assert(user.uid == currentUser.uid);
    print("8");
    print('signInWithGoogle succeeded: $user');
    return currentUser;

  }


}