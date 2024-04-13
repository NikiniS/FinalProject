import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:camera/camera.dart';
import 'dart:io';


class ImageSender {

  late IO.Socket socket;
  static String currentMood="None";
  late CameraController _controller;
  late List<CameraDescription> _cameras;

  ImageSender(){

    _initCamera();

    this.socket = IO.io('http://127.0.0.1:5000', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.onConnect((_) {
      print('connected');
    });

    print('image handler initialized');

    //receives the mood sent from the backend
    socket.on('receive mood', (data) async{

      currentMood = data;
      print(currentMood);

    });

  }

  //initialize the camera
  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.medium);
    await _controller.initialize();

  }

  //capturing the image
  Future<void> captureAndSendImage() async {
    try {
      XFile file = await _controller.takePicture();
      File imageFile = File(file.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      socket.emit('image', [base64Image]);
    } catch (e) {
      print(e);
    }
  }


  Future<void> sendImageFromAsset(String assetPath) async {

    ByteData byteData = await rootBundle.load(assetPath);
    List<int> bytes = byteData.buffer.asUint8List();
    String base64Image = base64Encode(bytes);

    socket.emit('image', [base64Image]);

  }

  IO.Socket getSocket(){
    return socket;
  }


  bool isConnected(){

    if(socket==null){
      return false;
    }
    return socket.connected;

  }

  @override
  void dispose() {

    if(_controller!=null){
      _controller.dispose();
    }
    if(socket!=null){
      _controller.dispose();
    }


  }



}
