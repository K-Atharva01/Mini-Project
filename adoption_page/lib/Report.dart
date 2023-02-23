import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Report extends StatelessWidget{
  File? _image;
  Future getImage( ImageSource source) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image == null) return;
  final imageTemporary = File(image.path);


  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Report an Accident'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        children: [
          SizedBox(height:40),

         Image.network('https://www.seekpng.com/png/detail/246-2467629_upload-your-logo-here-traffic-sign.png'),
          SizedBox(height:40),
        CustomButton(
      title: 'Pick from Gallery',
      icon: Icons.image_outlined,
      onClick: () => getImage(ImageSource.gallery),
    ),
      CustomButton(
          title: 'Upload from Camera',
          icon: Icons.image_outlined,
          onClick: () => getImage(ImageSource.camera),
      ),  ]

      ),
    ),
  );
}
Widget CustomButton({
    required String title,
  required IconData icon,
  required VoidCallback onClick,
}
    ) {
  return Container(
    width: 280,
    child: ElevatedButton(
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