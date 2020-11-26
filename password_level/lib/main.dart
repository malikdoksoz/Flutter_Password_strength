import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password_strength',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _passController = TextEditingController();

  int _passwordSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //password textfield
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: _passController,
            obscureText: true,
            decoration: InputDecoration(
                hintMaxLines: 1,
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
                enabledBorder: _customInputBorder(),
                focusedBorder: _customInputBorder()),
            onChanged: (s) {
              setState(() => _passwordSize = s.length);
            },
          ),
        ),

        //Row of Containers
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _customContainer(3, Colors.red),
              _customContainer(6, Colors.yellow),
              _customContainer(9, Colors.blue),
              _customContainer(12, Colors.green),
            ],
          ),
        )
      ],
    ));
  }

  InputBorder _customInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[900], width: 1),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 10);
  }

  /**
   * strengthSize : the length required
   * color: the color if the size is met
   */
  Widget _customContainer(int strengthSize, Color color) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 50,
      decoration: BoxDecoration(
        color: _passwordSize >= strengthSize ? color : Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
