import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class todo extends StatefulWidget {
  const todo({Key? key}) : super(key: key);

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              "ToDo",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
              ),
            ),
            Text(" Plan"),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is your plan",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            // For Space between the content and text field
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ), // Box shadow for the textfield
                ],
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Container(
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    " (optional)",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                  )
                ],
              ),
            ), // For TextField

            SizedBox(
              height: 10.0,
            ),

            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ), // Box shadow for the textfield
                ],
              ),
              child: TextField(
                maxLines: 2,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20.0)),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Text(
              "Calender",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      dialog_box(context);
                    },
                    child: Icon(
                      Icons.calendar_month_rounded,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void dialog_box(BuildContext context) {
  var firstDate = 0;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Calender Details",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          content: Row(
            children: [],
          ),
        );
      });
}
