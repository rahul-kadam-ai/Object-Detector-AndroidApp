import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;


void main() {
  runApp(myapp_main());
}

class myapp_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _img;
  Future get_img(bool is_camera) async {
    File img;
    if (is_camera) {
      img = await ImagePicker.pickImage(source: ImageSource.camera);
    } else
      img = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _img = img;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset(
                'assets/images/6.jpeg',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Text(
                  "Capstone - Image Captioning",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Source Sans Pro",
                    color: Colors.red[800],
                    fontWeight: FontWeight.bold,
                  ),),)
            ],
          ),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _img == null?Container(): Image.file(_img, height: 400.0,width: 350.0),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(icon: Icon(Icons.insert_drive_file),iconSize: 25.0,
                    onPressed: (){
                      get_img(false);
                    }),
              IconButton(icon: Icon(Icons.camera_enhance),iconSize: 25.0,
                    onPressed: (){
                      get_img(true);
                    }),
              SizedBox(height: 10.0, width: 6.0),
              Expanded(child: RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Custom'),
              ),),
              SizedBox(height: 10.0, width: 10.0),
              Expanded(child: RaisedButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Pretrained'),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

