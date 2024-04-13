import 'package:flutter/material.dart';
import 'package:final_project/components/button.dart';
import 'package:final_project/controller/notifications.dart';
import 'package:final_project/pages/dashboard/main_screen.dart';
import 'package:final_project/pages/face_detection/camera_screen.dart';
import 'package:final_project/pages/registration/login.dart';
import 'package:camera/camera.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io';


class FaceImageScanScreen extends StatefulWidget {

  List<CameraDescription> cameras= [];
  static String currentMood="None";
  bool isCameraInitialized = false;

  FaceImageScanScreen({Key? key}) : super(key: key){
    CameraScreen.currentMood = "None";
  }

  @override
  _FaceImageScanScreenState createState() => _FaceImageScanScreenState();

}

class _FaceImageScanScreenState extends State<FaceImageScanScreen> {

  late CameraController _controller;
  late BuildContext _context;

  @override
  void initState() {

    super.initState();
    _intiateCamera();

  }


  //initiate the camera of the device
  Future<void> _intiateCamera() async{

    try{
      widget.cameras = await availableCameras();
    }
    catch(e){
      NotificationStack.DisplayMessage(Message: "No available cameras",context: _context);
    }


    if(widget.cameras.length>0){
      _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
      _controller!.initialize().then((_) {

        if (!mounted) {
          //message which displays the dialog if the camera is not initialized
          NotificationStack.DisplayMessage(Message: "Camera is not Initialized Correctly Try Again",context: _context);

          return;
        }
        setState(() {

          NotificationStack.DisplayMessage(Message: "Camera is Initialized",context: _context,status: true);
          widget.isCameraInitialized = true;

        });
      });
    }
    else{
      NotificationStack.DisplayMessage(Message: "Unable to Initialize the camera",context: _context);
    }

  }



  @override
  Widget build(BuildContext context) {

    _context = context;

    if(CameraScreen.currentMood!="None"){
      return Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Loading indicator
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              // Column containing camera icon and text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Camera Icon
                  Icon(
                    Icons.camera_alt,
                    size: 50.0,
                    color: Colors.grey[700],
                  ),
                  // Text
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Face your expression to the camera",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                      buttonText: "Avoid Detection",
                      buttonColor: Colors.red.shade800,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(username:LoginBodyScreen.username)));
                      }),


                ],
              ),
            ],
          ),
        ),
      );
    }

    else if(widget.isCameraInitialized) {

      //if the camera is not initialized display this part
      return CameraScreen(cameras: widget.cameras, controller: _controller);

    }

    else{
      return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // Column containing camera icon and text
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Camera Icon
                  Icon(Icons.not_interested,color: Colors.red,size: 50,),
                  // Text
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Cannot Find any Cameras",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  MyButton(
                      buttonText: "Avoid Detection",
                      buttonColor: Colors.red.shade800,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen(username:LoginBodyScreen.username)));
                      }),
                ],
              ),
            ],
          ),
        ),
      );
    }

  }

  @override
  void dispose() {

    if(_controller!=null){
      _controller!.dispose();
    }

    super.dispose();

  }
}
