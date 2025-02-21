import 'package:flu_appone/Dashboard.dart';
import 'package:flu_appone/DioNetworkCall.dart';
import 'package:flu_appone/FirstScreen.dart';
import 'package:flu_appone/ListScreen.dart';
import 'package:flu_appone/SecondScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  String username = "";
  TextEditingController usernameInput = TextEditingController();

  void processText() {
    setState(() {
      username = usernameInput.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username.isEmpty ? "Login Screen" : "Welcome, $username"), // Conditional title

      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 10),
       // color: Colors.cyanAccent,
        child: Column(
          children: [
            TextField(
                controller: usernameInput,
              decoration: InputDecoration(
                labelText: "username",
                hintText: "Enter your username",

              ),

            ),
            SizedBox(height: 20),
            ElevatedButton(

                onPressed: (){
                 //Navigator.pushNamed(context, '/dashboard',arguments: "Hello Ansari");
                 //  Navigator.of(context).push(
                 //      MaterialPageRoute(builder: (context) => Dashboard(value: "ANSARI") ));
                 Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => Dionetworkcall() ));

                }, child: Text("SUBMIT ")),
            SizedBox(height: 20),
            Text("username is : $username",
            style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            Text("Body Text",    ),
          ],
        ),
      ),
    );
  }
}
