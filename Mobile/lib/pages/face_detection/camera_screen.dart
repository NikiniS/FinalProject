import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:final_project/pages/face_detection/face_detecting.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../controller/notifications.dart';
import '../../pages/dashboard/main_screen.dart';
import '../face_detection/face_detecting.dart';
import '../registration/login.dart';


class CameraScreen extends StatefulWidget {

  List<CameraDescription> cameras;
   late IO.Socket socket;
   static String currentMood="None";
   bool isSocketConnected = false;
   late CameraController controller;
  CameraScreen({required this.cameras,required this.controller});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  @override
  void dispose() {

    if(widget.socket!=null){
      widget.socket.disconnect();
      widget!.socket!.dispose();
      widget.controller.dispose();
    }

    super.dispose();

  }

  late BuildContext _context;

  @override
  void initState() {

    super.initState();
    _initiateSocketIO();


  }

  void _initiateSocketIO(){

    try{

      widget.socket = IO.io('http://127.0.0.1:5000', <String, dynamic>{
        'transports': ['websocket'],
      });

      widget.socket.onConnect((_) {
        widget.isSocketConnected = true;

        setState(() {
          print("connected");
        });

      });

      widget.socket.on('mood', (data) {

          if(CameraScreen.currentMood=="None"){
            print(data['message']);
            CameraScreen.currentMood = data['message'];
            MainScreen.currentMood = data['message'];
          }

          setState(() {

          });

      });



    }catch(e){
      NotificationStack.DisplayMessage(Message: "Cannot initialize the websocket",context: _context);
    }

  }


  //captures the image
  Future<void> captureAndSendImage() async {
    try {

      XFile file = await widget.controller.takePicture();
      String base64Image = base64Encode(await file.readAsBytes());
      widget.socket.emit('image', [base64Image]);

    } catch (e) {

      print(e);

    }
  }

  
  @override
  Widget build(BuildContext context) {

    _context = context;

    if (!widget.isSocketConnected) {
      return Scaffold(
        body: Container(
          child: Text("No camera"),
        ),
      );
    }
    else if (CameraScreen.currentMood!="None"){

     return Scaffold(
        appBar: AppBar(title: Text('Camera Example')),
        body:Container(
          child:ElevatedButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(username:LoginBodyScreen.username)));

          },child: Text("Emotion Detected\nGo to main menu"),) ,
        ) ,


      );

    }
    return Scaffold(
      appBar: AppBar(title: Text('Face your expression')),
      body: CameraPreview(widget.controller),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          try {
            await captureAndSendImage();
            // You can do something with the captured image here
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }


}