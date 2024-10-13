import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<void> initialize() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyBcsTqK5O0zO2_GNWrWs3dZv8fnW_l6qLY",
          appId: "1:797974962000:android:860dff59df0a7305b25655",
          messagingSenderId: "797974962000",
          projectId: "clean-architecture-a2aca",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  }
}