import 'package:flutter/material.dart';
import 'package:skribbl/widget/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController= TextEditingController();
  late String? _maxRoundsValue ;
  late String? _roomSizeValue  ;
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
          DropdownButton<String>(
            focusColor: Color(0xffF5F5FA),
            items:<String>[
              '2',
              '3',
              '4',
              '5',
            ].map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,style: TextStyle(color: Colors.black),
                ))).toList(),
            hint: Text( "Select Max Rounds " ,
               style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),),
            onChanged: (String? value) {
              setState(() {
                _maxRoundsValue = value;
              });
            },
            ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          DropdownButton<String>(
            focusColor: Color(0xffF5F5FA),
            items:<String>[
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
            ].map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,style: TextStyle(color: Colors.black),
                ))).toList(),
            hint: Text("Select Max People ", style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),),
            onChanged: (String? value) {
              setState(() {
                _roomSizeValue = value;
              });
            },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
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