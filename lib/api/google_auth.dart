import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  static final _clientId = '1039340464452-6rurkcnf1d15sjfqa3ckvs8062u1fpgs.apps.googleusercontent.com';
  static final _serverClientId = '1039340464452-rnh9fr1m1aikh1t8bhtk64d6h9uibjdu.apps.googleusercontent.com';
	static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool _initialized = false;
	
  static Future<void> initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize(clientId: _clientId, serverClientId: _serverClientId);
      _initialized = true;
    } catch (e) {
      debugPrint("Failed initiating google login");
    }

    _googleSignIn.authenticationEvents
      .listen((_) {
        // (Opsional) Dieksekusi jika ada perubahan auth, misal dari logout ke login atau sebaliknya maka akan dieksekusi
      })
      .onError((_) {debugPrint('Error authenticating');});
  }

  static void signIn() async {
    if(!_initialized){
      await initializeGoogleSignIn();
    }
    await GoogleAuth.initializeGoogleSignIn();
    try {
      GoogleSignInAccount googleSignInAccount = await GoogleSignIn.instance.authenticate();
      debugPrint(googleSignInAccount.authentication.idToken);
      // Kirim ke backend ke alamat /api/auth/google
    } catch (e) {
      debugPrint("GOOGLE AUTH FAILED");
      debugPrint(e.toString());
    }
  }
}