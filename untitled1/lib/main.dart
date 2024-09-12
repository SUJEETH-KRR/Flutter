import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Race Game'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Image.asset(
                      'images/car.jpg',
                      width: 250,
                      height: 250,
                    ),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Car A'),
                        content: Text('You are currently choosing car A'),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'cancel'),
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'ok'),
                              child: Text('Ok')),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Image.asset('images/car.jpg'),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Center(child: Text('Car B')),
                        content: Text('You are currently choosing car B'),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Ok'),
                              child: Text('Ok')),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, 'Remind me later'),
                              child: Text('Remind me later'))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: Text('Play'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white, primary: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}


// class FirstRoute extends StatelessWidget {
//   const FirstRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Car Race Game'),
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Row(
//               children: <Widget>[
//                 Expanded(
//                   child: FlatButton(
//                     child: Image.asset(
//                       'images/car.jpg',
//                       width: 250,
//                       height: 250,
//                     ),
//                     onPressed: () => showDialog(
//                       context: context,
//                       builder: (BuildContext context) => AlertDialog(
//                         title: Text('Car A'),
//                         content: Text('You are currently choosing car A'),
//                         actions: <Widget>[
//                           TextButton(
//                               onPressed: () => Navigator.pop(context, 'cancel'),
//                               child: Text('Cancel')),
//                           TextButton(
//                               onPressed: () => Navigator.pop(context, 'ok'),
//                               child: Text('Ok')),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FlatButton(
//                     child: Image.asset('images/car.jpg'),
//                     onPressed: () => showDialog(
//                       context: context,
//                       builder: (BuildContext context) => AlertDialog(
//                         title: Center(child: Text('Car B')),
//                         content: Text('You are currently choosing car B'),
//                         actions: <Widget>[
//                           TextButton(
//                               onPressed: () => Navigator.pop(context, 'Cancel'),
//                               child: Text('Cancel')),
//                           TextButton(
//                               onPressed: () => Navigator.pop(context, 'Ok'),
//                               child: Text('Ok')),
//                           TextButton(
//                               onPressed: () =>
//                                   Navigator.pop(context, 'Remind me later'),
//                               child: Text('Remind me later'))
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               child: Text('Play'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SecondRoute()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                   onPrimary: Colors.white, primary: Colors.blueGrey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int ldice = 1;
  int rdice = 1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Play game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    ldice = Random().nextInt(6) + 1;
                    rdice = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/$ldice.jpg',
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      ldice = Random().nextInt(6) + 1;
                      rdice = Random().nextInt(6) + 1;
                      print("wow");
                    });
                  },
                child: Image.asset('images/$rdice.jpg',),
              ),
            ),
          ],
          // child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Text('Go back!'),
          // ),
        ),
      ),
    );
  }
}

// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
// }

//showDialog() - to show a dialog box
//AlertDialog() - decision to make
