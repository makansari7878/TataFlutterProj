import 'package:flutter/material.dart';
class Secondscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black26,
        child: Center(
          child: Container(
            color: Colors.white,
            child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(color: Colors.blue,
                margin: EdgeInsets.all(10),
                width: 100,
                height: 200,),
              Container(color: Colors.amberAccent,
                margin: EdgeInsets.all(10),
                width: 100,
                height: 300,)

            ],
          ),
          ),


        )
    );
  }
}