import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(App_1());
}

class App_1 extends StatelessWidget {
  const App_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: <Widget>[
        //     Container(
        //       color: Colors.white,
        //       child: SafeArea(child: Text('wow')),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.blueGrey,
        //       child: Text('Amazing'),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black45,
        //       child: Text('Fabolous'),
        //     )
        //   ],
        // ),
        //     body: Row(
        //       // mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: <Widget>[
        //         SizedBox(
        //           width: 50,
        //         ),
        //         Container(
        //           margin: EdgeInsets.fromLTRB(50, 100, 50, 100),
        //           padding: EdgeInsets.fromLTRB(20, 20, 100, 20),
        //           color: Colors.blueGrey,
        //           child: Text('Container 1'),
        //         ),
        //         Container(
        //           padding: EdgeInsets.fromLTRB(20, 20, 100, 20),
        //           color: Colors.lightBlueAccent,
        //           child: Text('Container 2'),
        //         )
        //       ],
        //     ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('images/elon.jpg'),
                ),
                Text(
                  'Elon Musk',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'CEO of SpaceX',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    letterSpacing: 10,
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Divider(
                    color: Colors.white,
                  )
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Padding(
                    padding: EdgeInsets.all(0.2),
                    child: ListTile(
                        leading: Icon(
                          Icons.info_outline_rounded,
                          size: 30,
                          color: Colors.teal,
                        ),
                        title: Text(
                          '91+ 5076 865 100',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 5),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//MaterialApp --> home: widget --> body: widget (flow)
//MaterialApp: Starting point of the app. contains many kinds of widgets (Appbar, Scaffold)
//home: Used to specify which widget to choose
//body: Starting point after home
//child: Used to contain another widget
//Scaffold: Comes under MaterialApp.
//SafeArea: used to avoid operating system interfaces.
//margin: EdgeInsets.fromLTRB(left, top, right, bottom),
//padding: EdgeInsets.fromLTRB(left, top, right, bottom),
//child --> children
//Column: Used to specify the contains should be in vertical.
//children: Used to contain many widgets
//width, height: double.infinity, //stretches the content to screen width. (or) crossAxisAlignment: CrossAxisAlignment.stretch,
//Sizedbox: Uses only height width properties to give space between
//style: TextStyle(). for text decoration
//Icon(): widget to get more icons if required
//Card(): Make corner round, does not contain padding()
//ListTile(): Very Useful for making forms(HTML) [leadind: , title: , ... ]
