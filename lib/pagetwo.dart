import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './dummy_data.dart';


Future<List<FollowerModel>> fetchHome(http.Client client) async {
  final response = await client.get(api[0]);
  print(response.body);
  return compute(parseFollowers, response.body);
}

List<FollowerModel> parseFollowers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  print(json.decode(responseBody));
  return parsed.map<FollowerModel>((json) => FollowerModel.fromJson(json)).toList();
}

class FollowerModel {
  final  String username;
  final  String userpic;

  FollowerModel({ this.username, this.userpic });

  factory FollowerModel.fromJson(Map<String, dynamic> json) {
    return FollowerModel(
      username: json['username'],
      userpic: json['userpic']
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  PageTwoState createState() {
    return new PageTwoState();
  }
}


class PageTwoState extends State<PageTwo> {
  @override
  void initState() {
    super.initState();
    // this.fetchHome().then((value) => {
    //   setState(() => {
    //     fuck = value.body,
    //   }),
    //   print(value.body)});
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Followers"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        elevation: 50,
      ),
      body: FutureBuilder<List<FollowerModel>>(
        future: fetchHome(http.Client()),
        builder: ( context, snapshot ) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
                    ? FollowersList(followers: snapshot.data)
                    : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

 
}

 class FollowersList extends StatelessWidget {
  final List<FollowerModel> followers;

  FollowersList({Key key, this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: followers.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(followers[index].userpic)),
            title: Text(followers[index].username),
        );
        
      },
    );
  }
 }
