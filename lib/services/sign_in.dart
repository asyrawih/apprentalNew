import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String imageUrl;
String email;
String uid;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  print(user.displayName);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  assert(user.email != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  uid = user.uid;

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  return 'signInWithGoogle succeeded: ${user.displayName}';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}
