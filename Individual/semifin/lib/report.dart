import 'dart:async';
import 'package:flutter/material.dart';
import 'package:semifin/sendmail.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class ImagePickerApp extends StatefulWidget {
  const ImagePickerApp({Key? key}) : super(key: key);

  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class _ImagePickerAppState extends State<ImagePickerApp>
{
  File? _image;
  Future getImage( ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.black) ,
        backgroundColor: Color(0xffd6b738),
        title: Text('Report an Accident'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(

          child: Column(
              children: [
                Text("Kindly keep your camera resolution on 1:1"),
                SizedBox(height:40),
                _image != null? Image.file(_image!, width: 250, height: 250, fit: BoxFit.cover) : Image.network('https://www.seekpng.com/png/detail/246-2467629_upload-your-logo-here-traffic-sign.png'),
                SizedBox(height:40),
                CustomButton(
                  title: 'Pick from Gallery',
                  icon: Icons.image_outlined,
                  onClick: () => getImage(ImageSource.gallery),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  title: 'Upload from Camera',
                  icon: Icons.camera,
                  onClick: () => getImage(ImageSource.camera),
                ),
                SizedBox(
                  height: 50,
                ),

                ElevatedButton( style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  minimumSize: Size(200, 45),
                ),
                    onPressed:
                        (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => sendmail())
                          );
                    },
                    child:
                    Text('Report'))
              ]

          ),
        ),
      ),
    );
  }
}

Widget CustomButton(
    {
      required String title,
      required IconData icon,
      required VoidCallback onClick,
    }
    ) {
  return Container(
    width: 280,
    child: ElevatedButton(style: ElevatedButton.styleFrom(
      primary: Colors.brown,
      minimumSize: Size(200, 45),
    ),
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width:20,),
          Text(title)

        ],
      ),

    ),
  );
}