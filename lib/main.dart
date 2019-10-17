import 'package:flutter/material.dart';
import 'package:gdgbloc/bloc.dart';
import 'package:gdgbloc/pagetwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurpleAccent,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.emailChanged,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.tealAccent),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: "Enter email",
                          hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                          // labelText: "Email",
                          errorText: snapshot.error,
                          errorStyle: TextStyle(color: Colors.tealAccent),
                          fillColor: Colors.deepPurpleAccent[100],
                          focusColor: Colors.deepPurple[50], filled: true),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextField(
                      onChanged: bloc.passwordChanged,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.tealAccent),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(
                              width: 0, 
                              style: BorderStyle.none,
                            ),
                          ),
                          
                          hintText: "Enter password",
                          hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                          // labelText: "Password",
                          errorText: snapshot.error,
                          errorStyle: TextStyle(color: Colors.tealAccent),
                          fillColor: Colors.deepPurpleAccent[100], filled: true,
                          focusColor: Colors.deepPurple[50]),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                // height: MediaQuery.of(context).size.height,
                width: 300,
                // height: 24.0,
              child:
              StreamBuilder<bool>(
                
                stream: bloc.submitCheck,
                builder: (context, snapshot) => RaisedButton(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Text("Submit"),
                      textColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      onPressed: () => changeThePage(context)
                          // ? () => changeThePage(context)
                          // : null,
                    ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
