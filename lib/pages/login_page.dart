import 'package:complete_project/widgets/bg_image.dart';
import 'package:complete_project/pages/home_page.dart';
import 'package:complete_project/utills/Constans.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children:<Widget> [
          BgImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Form(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Enter Valid Name",
                                      labelText: "User Name"),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Enter Password", labelText: "Password"),
                                )
                              ],
                            ),
                          )),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: (){

                          Constans.preferences.setBool("logged In" , true);
                          Navigator.pushReplacementNamed(context, "/homefb");
                        /* Navigator.push(context,
                             MaterialPageRoute(
                                 builder: (context) => HomePage())
                         );*/
                        },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red, backgroundColor: Colors.orange,
                              elevation: 5,  // Elevation
                              shadowColor: Colors.blue, // Shadow Color
                            ),
                            child: Text("Sign In",)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],)
    );
  }
}
