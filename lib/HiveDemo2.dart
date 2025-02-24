import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDemo2 extends StatefulWidget {
  @override
  _HiveDemo2State createState() => _HiveDemo2State();
}

class _HiveDemo2State extends State<HiveDemo2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool showData = false;
  Box? box;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    box = await Hive.openBox('myBox');
    setState(() {});
  }

  Future<void> saveData() async {
    await box!.add({
      'name': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
    });
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hive Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveData, child: Text("Save Data")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showData = true;
                });
              },
              child: Text("Show Data"),
            ),
            SizedBox(height: 20),
            showData
                ? Expanded(
              child: FutureBuilder(
                future: Future.value(box!.values.toList()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            title: Text("Name: ${data['name']}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email: ${data['email']}"),
                                Text("Phone: ${data['phone']}"),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}