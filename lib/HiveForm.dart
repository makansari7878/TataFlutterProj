import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Hiveform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HiveformState();
  }
}

class HiveformState extends State<Hiveform> {
  Box? box; // Declare a Box variable

  @override
  void initState() {
    super.initState();
    openBox(); // Initialize Hive box
  }

  Future<void> openBox() async {
    box = await Hive.openBox("myfile");
    setState(() {}); // Update UI when box is ready
  }

  void saveData() async {
    if (box != null) {
      box!.put("name", "Ansari");
      box!.put("age", 33);
      box!.put("details", {
        'email': 'mak@gmail.com',
        'college': 'AMC'
      });

      debugPrint(box!.get('name'));
      debugPrint(box!.get('age').toString());
      debugPrint(box!.get('details')['email']);
      setState(() {}); // Refresh UI after saving data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HIVE DB")),
      body: box == null
          ? Center(child: CircularProgressIndicator()) // Show loader until box is initialized
          : Container(
        color: Colors.cyanAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: saveData,
              child: Text("SAVE"),
            ),
            SizedBox(height: 20),
            Text("Name: ${box!.get('name', defaultValue: 'Unknown')}"),
            Text("Age: ${box!.get('age', defaultValue: 'N/A')}"),
            Text(
                "Email: ${box!.get('details', defaultValue: {})?['email'] ?? 'Not Available'}"),
            Text(
                "College: ${box!.get('details', defaultValue: {})?['college'] ?? 'Not Available'}"),
          ],
        ),
      ),
    );
  }
}
