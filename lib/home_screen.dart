import 'package:flutter/material.dart';
import 'package:skribbl/create_room_screen.dart';
import 'package:skribbl/join_room_screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create/Join a room to play", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinRoomScreen (), // Replace CreateRoomPage with the actual widget of the page you want to navigate to
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
                  child: Text("Join",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
              ],
            )
          ],
        )
      ),
    );
  }
}