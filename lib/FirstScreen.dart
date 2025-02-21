import 'dart:math';

import 'package:flutter/material.dart';


class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("My First Screen"),
        ),
        body:  Material(
          color: Colors.yellow,
          child: Center(
            child: Container(
              //padding: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 25, left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "FIRST Row number -- ${getRandomNumber()} ",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Text(
                        "Second Row -- ${getRandomNumber()} ",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Image.asset("images/road.jpg", height: 200, width: 200,)
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: () => showDialog(context: context,
            builder: (ctx) => MyAlertBox()),
                          child: Text("Submit"))
                    ],
                  ),
                  Row(
                    children: [
                      getListView()
                    ],
                  ),
                ],
              ),
            )
          ),
        )
    );


  }

  int getRandomNumber(){
    var random = Random();
    var num = random.nextInt(10);
    return num;
  }

  List<String> getListElements() {
    // This will be a data source which will generate random items till 1000
    var items = List<String>.generate(1000, (counter) => "Item $counter");
    return items;
  }

  Widget getListView() {
    var listItems = getListElements();

    var listView = ListView.builder(
      itemCount: listItems.length, // Specify the number of items
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listItems[index]),
          onTap: () {
            debugPrint("${listItems[index]} you clicked");
          },
        );
      },
    );

    return listView;
  }


}

class MyAlertBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
     title: Text("Alert box !!1"),
     content: Text("This is my alert Box"),
     actions: [
       ElevatedButton(onPressed: (){
         Navigator.of(context).pop();
       },
           child: Text("OK"))
     ],
   );
  }

}