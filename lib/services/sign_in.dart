import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// * Buat Instance Untuk Firebase dan googleSignIn

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
// * Property Yang Akan di Panggil di UI
String name;
String imageUrl;
String email;
String uid;


Future<String> signInWithGoogle() async {
  // * Sediakan Methode Untuk Login google
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  // * instance Object googleSign Account Sebgai AUTH Middleware
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  // * Popolate Auht Crentialn Nya Ketika Login
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  // * Penetrate hasil Login dengan Mempasaing hasil Creditial nya
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  // * Get Data Profile Dari user yang Sudah Login
  final FirebaseUser user = authResult.user;

  print(user.displayName);
  // Cek user
  assert(!user.isAnonymous);
  // Cek Token
  assert(await user.getIdToken() != null);
  // Cek email
  assert(user.email != null);
  // isi Propertu Nya 
  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  uid = user.uid;
  // ! Ambil User yang Sedang Login
  final FirebaseUser currentUser = await _auth.currentUser();
  // ! Cek user yang di firebase sama Dengan Yang login Sekrang
  assert(user.uid == currentUser.uid);
  // Return nilai
  return 'signInWithGoogle succeeded: ${user.displayName}';
}
// Method Untuk Logout
void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}
