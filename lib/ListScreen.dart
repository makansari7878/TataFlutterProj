
import 'package:flutter/material.dart';


class ListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Material(
        child: getListView(),
   );
  }

  Widget simpleList(){
    var listView = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("INDIA"),
          subtitle: Text("Delhi"),
          trailing: Icon(Icons.access_alarm),
          onTap: ()=> print("ITEM CLICKED"),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("SRI LANKA"),
          subtitle: Text("Colombo"),
          trailing: Icon(Icons.access_alarm),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("ENGLAND"),
          subtitle: Text("London"),
          trailing: Icon(Icons.access_alarm),
        ),
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("USA"),
          subtitle: Text("washington"),
          trailing: Icon(Icons.access_alarm),
        ),
      ],
    );
    return listView;
  }


  List<String> getListElements() {
    // This will be a data source which will generate random items till 1000
    var items = List<String>.generate(1000, (counter) => "Item Number $counter");
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