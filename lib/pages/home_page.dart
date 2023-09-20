import 'package:complete_project/widgets/change_name_card.dart';
import 'package:complete_project/widgets/drawer.dart';
import 'package:complete_project/utills/Constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Chnage Me";
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {

            Constans.preferences.setBool( "loggedIn", false);
            Navigator.pushReplacementNamed(context, "/login");
          })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(data[index]["title"]),
                        leading: Image(
                          image: NetworkImage(data[index]["thumbnailUrl"]),
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                        ),
                        subtitle: Text("ID: ${data[index]["id"]}"),
                      ),
                    );
                  },
                  itemCount: data.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          print(myText.toString());
          setState(() {});
        },
        child: Icon(Icons.refresh), //
      ),
    );
  }
}
// thik h issue kya tha sir vo web k lye render krne k lye command run krni pdti h aap mujhe whtsapp kr dena command
//flutter run -d chrome --web-renderer html
