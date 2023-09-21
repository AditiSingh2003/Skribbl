import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';


class Socket extends StatefulWidget {
  const Socket({super.key});

  @override
  State<Socket> createState() => _SocketState();
}

class _SocketState extends State<Socket> {
  late IO.Socket _socket;
  @override
  void initState(){
    super.initState();
    connect();

  }
  void connect() {
    _socket = IO.io('http://152.58.130.201:3000', <String, dynamic> {
      'transports' : ['websocket'],
      'autoConnect' : false,
    });
    _socket.onConnect((data) => print('Connection in socket done'));
    //listen to socket
    _socket.onConnect((data) => print(data));
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}