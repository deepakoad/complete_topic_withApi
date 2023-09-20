import 'package:complete_project/widgets/change_name_card.dart';
import 'package:complete_project/widgets/drawer.dart';
import 'package:complete_project/utills/Constans.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageFB extends StatefulWidget {
  @override
  State<HomePageFB> createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  Future getData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
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
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
              return Center(
                child: Text("Fetching Something"),
              );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if(snapshot.hasError){
                  return Center(
                    child: Text("SomeError Occured"),
                  );
                }
                return  ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(snapshot.data[index]["title"]),
                        leading: Image(
                          image: NetworkImage(snapshot.data[index]["thumbnailUrl"]),
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                        ),
                        subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );

            }
          },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         /* myText = _nameController.text;
          print(myText.toString());
          setState(() {});*/
        },
        child: Icon(Icons.refresh), //
      ),
    );
  }
}
// thik h issue kya tha sir vo web k lye render krne k lye command run krni pdti h aap mujhe whtsapp kr dena command
//flutter run -d chrome --web-renderer html
