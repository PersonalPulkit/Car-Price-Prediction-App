import 'package:ai/data/network/FirestoreServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../custom_widgets/elevatedbutton.dart';
import '../routes/app_routes.dart';

class GoogleSSO extends StatefulWidget {
  final Size? size;
  const GoogleSSO({super.key, this.size});

  @override
  State<GoogleSSO> createState() => _GoogleSSOState();
}

class _GoogleSSOState extends State<GoogleSSO> {
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWithIcon(
      text: "Sign in with Google",
      callBack: () async {
        var user = FirebaseAuth.instance.currentUser;
        if (kDebugMode) {
          print("----------------------$user--------------------------------");
        }
        if (user == null) {
          await signInWithGoogle();
          user = FirebaseAuth.instance.currentUser;
          if (kDebugMode) {
            print(
                "----------------------user is signed in using google $user--------------------------------");
          }
          bool userExist = (await isNewUser(user!));
          if (kDebugMode) {
            print(
                "----------------------does user exist? ${!userExist}--------------------------------");
          }

          if (userExist) {
            await addUserToFirestore();
            if (kDebugMode) {
              print(
                  "----------------------new user added ${user.email}--------------------------------");
            }
          }

          Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
        }
      },
      icon: const Icon(FontAwesomeIcons.google),
      size: widget.size,
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> addUserToFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = {
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName,
        'profilePhoto': user.photoURL,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData);

    }
  }

  Future<bool> isNewUser(User user) async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user.uid)
        .get();

    return result.docs.isEmpty;
  }
}
