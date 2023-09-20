import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
    /* DrawerHeader(
              child: Text("Hi I am drawer",
              style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(color: Colors.purple),
            ),*/
    UserAccountsDrawerHeader(
    accountName: Text("Deep"),
    accountEmail: Text("Deep@gmail.com"),
    currentAccountPicture: CircleAvatar(
    backgroundImage: NetworkImage(
    "https://images.unsplash.com/photo-1492446845049-9c50cc313f00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bWVufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
    ),
    ),
    ListTile(
    leading: Icon(Icons.person),
    title: Text("Account"),
    subtitle: Text("Personal"),
    trailing: Icon(Icons.edit),
    ),
    ListTile(
    leading: Icon(Icons.email),
    title: Text("Email"),
    subtitle: Text("Deep@gmail.com"),
    trailing: Icon(Icons.send),
    ),
    ],
    ),
    );
  }
}
