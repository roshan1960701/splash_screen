import 'package:flutter/material.dart';

class advanceUi extends StatefulWidget {
  @override
  _advanceUiState createState() => _advanceUiState();
}

class _advanceUiState extends State<advanceUi> {
  double width = 200;
  double height = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize:MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                width = 400;
                height = 400;
              });

            },
            onDoubleTap: (){
              setState(() {
                width = 200;
                height = 200;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              width: width,
              height: height,
              color: Colors.red,
            ),
          ),
        ],

      ),
    );
  }
}
