import 'package:flutter/material.dart';
import 'package:skribbl/widget/custom_text_field.dart';
import 'create_room_screen.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text("Create Room", style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _nameController,
              hintText: "Enter Your Name",
            ) ,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _roomNameController,
              hintText: "Enter Room Name",
            ) ,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
            ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateRoomScreen(), // Replace CreateRoomPage with the actual widget of the page you want to navigate to
                    ),
                  );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    textStyle: MaterialStateProperty.all(TextStyle(color: Colors.white),),
                    minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width / 2.5, 50)),
                  ),
                  child: Text("Create",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
        ],
      ),
    );
  }
}