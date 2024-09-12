import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future <void> main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(todo());
}

class todo extends StatelessWidget {
  const todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: login()
    );
  }
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

String username = "";

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    String email = "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Login with google"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Username: "),
              Text(email),
            ],
          ),
          ElevatedButton(onPressed: () async {
            await GoogleSignIn().signIn();
            setState(() {

            });
          }, child: Text("Login")),
          ElevatedButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            username = "";
            await GoogleSignIn().signOut();
            setState(() {

            });
          }, child: Text("Logout")),
        ],
      ),
    );

    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      username = googleUser!.email;
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}

//---------------------------------------------------------------------//

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() {
//   runApp(const login());
// }
//
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: homepage(),
//     );
//   }
// }
//
// class homepage extends StatefulWidget {
//   const homepage({Key? key}) : super(key: key);
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//
//   Future<FirebaseApp> _intializeFireBase () async {
//     Firebase firebaseApp = await FireBase.initializeApp();
//     return firebaseApp;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//           future: _intializeFireBase(),
//           builder: (context, snapshot) {
//             if(snapshot.connectionState == ConnectionState.done) {
//               return loginscreen();
//             }
//             return const Center(child: CircularProgressIndicator(
//             ),);
//           },
//         ),
//     );
//   }
// }
//
//
// class loginscreen extends StatefulWidget {
//   const loginscreen({Key? key}) : super(key: key);
//
//   //login fucnction
//   static Future<User?> loginUsingEmailPassword( {
//     required String email,
//     required String password, required BuildContext context) async{
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCrediential userCredential = await auth.signInWihEmailAnd Password(email: email, password: password);
//       user = userCrediential.user;
//   } on FirebaseAuthException catch (e) {}
//
//   }
//   })
//
//   @override
//   State<loginscreen> createState() => _loginscreenState();
// }
//
// class _loginscreenState extends State<loginscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: EdgeInsets.all(15.0),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text("Todo list",
//           style: TextStyle(color: Colors.black,
//             fontSize: 25,
//           fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text("Login to your app",
//           style: TextStyle(letterSpacing: 2),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         TextField(
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             hintText: "Username",
//             prefixIcon: Icon(Icons.email, color: Colors.black,)
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         TextField(
//           keyboardType: TextInputType.visiblePassword,
//           decoration: InputDecoration(
//             hintText: "Password",
//             prefixIcon: Icon(Icons.lock, color: Colors.black,)
//           ),
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Text("Forget password"),
//         SizedBox(
//           height: 15,
//         ),
//         Container(
//           width: double.infinity,
//           child: RawMaterialButton(
//             elevation: 10,
//             padding: EdgeInsets.symmetric(vertical: 20.0),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             onPressed: () {},
//             fillColor: Colors.blue,
//             child: Text("Login",
//               style: TextStyle(
//                   fontSize: 20.0,
//                   color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//     );
//   }
// }
//
