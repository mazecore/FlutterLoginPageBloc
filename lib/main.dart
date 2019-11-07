import 'package:flutter/material.dart';
import 'package:instAVenger/bloc.dart';
import 'package:instAVenger/pagetwo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  changeThePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PageTwo()));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      // appBar: AppBar(
      //   title: Text("Sign in with your instagram account"),
      //   backgroundColor: Colors.deepPurpleAccent,
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Center(
        // child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepOrangeAccent, Colors.deepPurpleAccent],
            stops: [-.4, .8],
          )),
          padding: EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Spacer(
                flex: 8,
              ),
              Text(
                "Sign in with your instagram account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.pink[50],
                  fontSize: 20,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              StreamBuilder<String>(
                stream: bloc.email,
                builder: (context, snapshot) => TextFormField(
                  onChanged: bloc.emailChanged,
                  keyboardType: TextInputType.emailAddress,
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                      // labelText: "Email",
                      // labelStyle: TextStyle(color: Colors.white),
                      errorText: snapshot.error,
                      errorStyle: TextStyle(color: Colors.pinkAccent),
                      fillColor: Colors.purple[100],
                      focusColor: Colors.deepPurple[50],
                      filled: true),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              StreamBuilder<String>(
                stream: bloc.password,
                builder: (context, snapshot) => TextFormField(
                  onChanged: bloc.passwordChanged,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.deepPurple),
                  // textAlign: TextAlign.center,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                      // labelText: "Password",
                      // labelStyle: TextStyle(color: Colors.white),
                      errorText: snapshot.error,
                      errorStyle: TextStyle(color: Colors.redAccent),
                      fillColor: Colors.purple[100],
                      filled: true,
                      focusColor: Colors.deepPurple[50]),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: StreamBuilder<bool>(
                      stream: bloc.submitCheck,
                      builder: (context, snapshot) => RaisedButton(
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          child: Text("LOG IN"),
                          textColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          onPressed:
                              // snapshot.hasData
                              () => changeThePage(context)
                          // ? () => changeThePage(context)
                          // : changeThePage(context),
                          ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 8,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
