import 'package:flutter/material.dart';
import 'package:untitled2/pages/todo.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // For center Alignment
          children: [
            Text(
              "Remainder",
              style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Text(
              " Application",
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => todo()));
        }, // For Naviating to todo page
        child: Icon(Icons.add),
      ),
    );
  }
}
