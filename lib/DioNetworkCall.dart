import 'package:flutter/material.dart';
import 'package:flu_appone/User.dart';
import 'package:dio/dio.dart';

class Dionetworkcall extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DionetworkcallState();
  }
}

class DionetworkcallState extends State<Dionetworkcall> {

  late Future<List<User>> _usersFuture;
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _usersFuture = getRequest();
  }

  Future<List<User>> getRequest() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      var responseData = response.data;

      List<User> users = [];
      for (var singleUser in responseData) {
        User user = User(
            id: singleUser["id"],
            userId: singleUser["userId"],
            title: singleUser["title"],
            body: singleUser["body"]);

        users.add(user);
      }

      // Log the users list before returning it
      debugPrint("User List:");
      users.forEach((user) {
        debugPrint("User ID: ${user.id}, Title: ${user.title}, Body: ${user.body}");
      });

      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<User>>(
                future: _usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    List<User> users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].title,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          subtitle: Text(users[index].body),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No data'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}