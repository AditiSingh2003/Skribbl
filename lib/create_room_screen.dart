import 'package:flutter/material.dart';
import 'package:skribbl/paint_screen.dart';
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


  // create room function
  void createRoom(){
    if(_nameController.text.isNotEmpty && _roomNameController.text.isNotEmpty && _maxRoundsValue != null && _roomSizeValue != null){
      Map <String,String> data = {
        "nickname": _nameController.text,
        "name": _roomNameController.text,
        "occupancy": _maxRoundsValue!,
        "maxRounds": _roomSizeValue! ,
      };
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom',)));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
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
                      onPressed: createRoom,
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
        ),
      ),
    );
  }
}