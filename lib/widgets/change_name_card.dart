import 'package:complete_project/widgets/bg_image.dart';
import 'package:flutter/material.dart';

class ChnageNameCard extends StatelessWidget {
  const ChnageNameCard({
    super.key,
    required this.myText,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BgImage(),
        SizedBox(
          height: 20,
        ),
        Text(
          myText,
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameController,
            keyboardType: TextInputType.number,
            //obscureText: true, password ************
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Something Here...",
              labelText: "Name",
            ),
          ),
        )
      ],
    );
  }
}