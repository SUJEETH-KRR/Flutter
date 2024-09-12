// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   await Firebase.initializeApp();
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     // theme: ThemeData(
//     //   accentColor: Colors.yellow,
//     // ),
//     home: todo(),
//   ));
// }
//
// class todo extends StatefulWidget {
//   const todo({Key? key}) : super(key: key);
//
//   @override
//   State<todo> createState() => _todoState();
// }
//
// class _todoState extends State<todo> {
//   List todos = [];
//   String input = "";
//   String desc = "";
//   @override
//   void initState() {
//     super.initState();
//     // todos.add("Item1");
//     todos = ["wow"];
//   }
//
//   createTodos() {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection("My todos").doc(input);
//     Map<String, String> todos = {"todotitle": input, "tododesc": desc};
//     documentReference.set(todos).whenComplete(() {
//       print("$input created");
//     });
//   }
//
//   deleteTodos(item) {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection("MyTodos").doc(item);
//     documentReference.delete().whenComplete(() => print("$item deleted successfully"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int index;
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('My todo task')),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuilderContext) {
//                   return AlertDialog(
//                     title: Center(child: Text('Add todo list')),
//                     content: TextField(
//                       onChanged: (String value) {
//                         input = value;
//                       },
//                     ),
//                     actions: <Widget>[
//                       FlatButton(
//                           onPressed: () {
//                             setState(() {
//                               todos.add(input);
//                               createTodos();
//                             });
//                             Navigator.of(context).pop();
//                           },
//                           child:
//                               Text('Add', style: TextStyle(color: Colors.blue)))
//                     ],
//                   );
//                 });
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         // body: ListView.builder(
//         //     //Listview
//         //     itemCount: todos.length,
//         //     itemBuilder: (BuildContext context, int index) {
//         //       return Dismissible(
//         //         //list can be dismissed or deleted by using this widget
//         //         key: Key(todos[index]),
//         //         child: Card(
//         //           elevation: 5,
//         //           child: ListTile(
//         //             title: Text(
//         //               todos[index],
//         //             ),
//         //             trailing: IconButton(
//         //               icon: Icon(
//         //                 Icons.delete,
//         //                 color: Colors.red,
//         //               ),
//         //               onPressed: () {
//         //                 setState(() {
//         //                   todos.removeAt(index);
//         //                 });
//         //               },
//         //             ),
//         //           ),
//         //         ),
//         //       );
//         //     })
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             } else if (snapshot.hasData || snapshot.data != null) {
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     QueryDocumentSnapshot<Object?>? documentSnapshot =
//                     snapshot.data?.docs[index];
//                     return Dismissible(
//                         key: Key(index.toString()),
//                         child: Card(
//                           elevation: 4,
//                           child: ListTile(
//                             title: Text((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : ""),
//                             subtitle: Text((documentSnapshot != null)
//                                 ? ((documentSnapshot["todoDesc"] != null)
//                                 ? documentSnapshot["todoDesc"]
//                                 : "")
//                                 : ""),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.delete),
//                               color: Colors.red,
//                               onPressed: () {
//                                 setState(() {
//                                   //todos.removeAt(index);
//                                   deleteTodos((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : "");
//                                 });
//                               },
//                             ),
//                           ),
//                         ));
//                   });
//             }
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   Colors.red,
//                 ),
//               ),
//             );
//           },
//         )
// //         body: StreamBuilder(
// //             stream: Firestore.instance.collection("MY todos").snapshots(),
// //             builder: (context. snapshots) {
// //               return ListView.builder(
// //             //Listview
// //             itemCount: snapshots.data.documents.length,
// //             itemBuilder: (context, int index) {
// //               return Dismissible(
// //                 //list can be dismissed or deleted by using this widget
// //                 key: Key(todos[index]),
// //                 child: Card(
// //                   elevation: 5,
// //                   child: ListTile(
// //                     title: Text(
// //                       todos[index],
// //                     ),
// //                     trailing: IconButton(
// //                       icon: Icon(
// //                         Icons.delete,
// //                         color: Colors.red,
// //                       ),
// //                       onPressed: () {
// //                         setState(() {
// //                           todos.removeAt(index);
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             }
// //             )
// //
// //         }),
//         );
//   }
// }
//
// // @override
// // void initState() {
// //   super.initState();
// //   todos.add("Item1");
// //   todos.add("Item2");
// //   todos.add("Item3");
// //   todos.add("Item4");
// // }
//
// //-------------------------------------------------------------------------//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Todo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: Center(child: const MyHomePage(title: 'My Todo task')),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List todos = List.empty();
//   String title = "";
//   String description = "";
//   @override
//   // void initState() {
//   //   super.initState();
//   //   todos = ["Hello", "Hey There"];
//   // }
//
//   createToDo() {
//     DocumentReference documentReference =
//     FirebaseFirestore.instance.collection("MyTodos").doc(title);
//
//     Map<String, String> todoList = {
//       "todoTitle": title,
//       "todoDesc": description
//     };
//
//     documentReference
//         .set(todoList)
//         .whenComplete(() => print("Data stored successfully"));
//   }
//
//   deleteTodo(item) {
//
//     DocumentReference documentReference =
//     FirebaseFirestore.instance.collection("MyTodos").doc(item);
//
//     documentReference.delete().whenComplete(() => print("deleted successfully"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           } else if (snapshot.hasData || snapshot.data != null) {
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.data?.docs.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   QueryDocumentSnapshot<Object?>? documentSnapshot =
//                   snapshot.data?.docs[index];
//                   return Dismissible(
//                       key: Key(index.toString()),
//                       child: Card(
//                         elevation: 4,
//                         child: ListTile(
//                           title: Text((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : ""),
//                           subtitle: Text((documentSnapshot != null)
//                               ? ((documentSnapshot["todoDesc"] != null)
//                               ? documentSnapshot["todoDesc"]
//                               : "")
//                               : ""),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete),
//                             color: Colors.red,
//                             onPressed: () {
//                               setState(() {
//                                 //todos.removeAt(index);
//                                 deleteTodo((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : "");
//                               });
//                             },
//                           ),
//                         ),
//                       ));
//                 });
//           }
//           return const Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(
//                 Colors.red,
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   title: Center(child: const Text("Add List")),
//                   content: Container(
//                     width: 400,
//                     height: 100,
//                     child: Column(
//                       children: [
//                         TextField(
//                           onChanged: (String value) {
//                             title = value;
//                           },
//                         ),
//                         TextField(
//                           onChanged: (String value) {
//                             description = value;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   actions: <Widget>[
//                     TextButton(
//                         onPressed: () {
//                           setState(() {
//                             //todos.add(title);
//                             createToDo();
//                           });
//                           Navigator.of(context).pop();
//                         },
//                         child: const Text("Add"))
//                   ],
//                 );
//               });
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   await Firebase.initializeApp();
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     // theme: ThemeData(
//     //   accentColor: Colors.yellow,
//     // ),
//     home: todo(),
//   ));
// }
//
// class todo extends StatefulWidget {
//   const todo({Key? key}) : super(key: key);
//
//   @override
//   State<todo> createState() => _todoState();
// }
//
// class _todoState extends State<todo> {
//   List todos = [];
//   String input = "";
//   String desc = "";
//   @override
//   void initState() {
//     super.initState();
//     // todos.add("Item1");
//     todos = ["wow"];
//   }
//
//   createTodos() {
//     DocumentReference documentReference =
//     FirebaseFirestore.instance.collection("My todos").doc(input);
//     Map<String, String> todos = {"todotitle": input, "tododesc": desc};
//     documentReference.set(todos).whenComplete(() {
//       print("$input created");
//     });
//   }
//
//   deleteTodos(item) {
//     DocumentReference documentReference =
//     FirebaseFirestore.instance.collection("MyTodos").doc(item);
//     documentReference.delete().whenComplete(() => print("$item deleted successfully"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int index;
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(child: Text('My todo task')),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//                 context: context,
//                 builder: (BuilderContext) {
//                   return AlertDialog(
//                     title: Center(child: Text('Add todo list')),
//                     content: TextField(
//                       onChanged: (String value) {
//                         input = value;
//                       },
//                     ),
//                     actions: <Widget>[
//                       FlatButton(
//                           onPressed: () {
//                             setState(() {
//                               todos.add(input);
//                               createTodos();
//                             });
//                             Navigator.of(context).pop();
//                           },
//                           child:
//                           Text('Add', style: TextStyle(color: Colors.blue)))
//                     ],
//                   );
//                 });
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Text('Something went wrong');
//             } else if (snapshot.hasData || snapshot.data != null) {
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: snapshot.data?.docs.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     QueryDocumentSnapshot<Object?>? documentSnapshot =
//                     snapshot.data?.docs[index];
//                     return Dismissible(
//                         key: Key(index.toString()),
//                         child: Card(
//                           elevation: 4,
//                           child: ListTile(
//                             title: Text((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : ""),
//                             subtitle: Text((documentSnapshot != null)
//                                 ? ((documentSnapshot["todoDesc"] != null)
//                                 ? documentSnapshot["todoDesc"]
//                                 : "")
//                                 : ""),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.delete),
//                               color: Colors.red,
//                               onPressed: () {
//                                 setState(() {
//                                   //todos.removeAt(index);
//                                   deleteTodos((documentSnapshot != null) ? (documentSnapshot["todoTitle"]) : "");
//                                 });
//                               },
//                             ),
//                           ),
//                         ));
//                   });
//             }
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation<Color>(
//                   Colors.red,
//                 ),
//               ),
//             );
//           },
//         )
//     );
//   }
// }