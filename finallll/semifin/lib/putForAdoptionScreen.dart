import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:semifin/AdoptionFormData.dart';

class putForAdoption extends StatefulWidget{
  @override
  State <putForAdoption> createState() => _putForAdoption();
}

TextEditingController Ptype=TextEditingController();
TextEditingController Pname=TextEditingController();
TextEditingController Page=TextEditingController();
TextEditingController Pgender=TextEditingController();
TextEditingController Pcolour=TextEditingController();
TextEditingController Oname=TextEditingController();
TextEditingController Ophone=TextEditingController();
TextEditingController Oaddress=TextEditingController();
var docref;
String imageurl="";

class _putForAdoption extends State <putForAdoption> {
   GlobalKey<FormState>_formkey1=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey2=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey3=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey4=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey5=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey6=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey7=GlobalKey<FormState>();
   GlobalKey<FormState>_formkey8=GlobalKey<FormState>();
  bool pressed=false;
  File? _image;
  XFile? file;
  late final _imageTemporary;
  var _opacity=0.2;
  // @override
  // void dispose(){
  //   Ptype.dispose();
  //   Pname.dispose();
  //   Page.dispose();
  //   Pgender.dispose();
  //   Pcolour.dispose();
  //   Oname.dispose();
  //   Ophone.dispose();
  //   Oaddress.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Put For Adoption !"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 250,
                width: 250,
                child: _image!=null? Image.file(_image!):Image.asset("assets/images/Dog4.jpg"),
              ),
              SizedBox(height: 20,),
              Container(
                height: 40,
                width:320,
                child:Row(
                  children: [
                    Text("Fill the information",style: TextStyle(fontStyle:FontStyle.italic,fontSize: 25,color: Colors.pink),),
                    SizedBox(width: 5,),
                    Icon(Icons.emoji_emotions),
                    SizedBox(width: 5,),
                    Icon(Icons.pets_sharp)
                  ],
                ),
              ),
              Container(
                width: 340,
                height: 270,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(11.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                    width: 310,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey1,
                          child: TextFormField(
                            maxLength: 7,
                            controller: Ptype,
                            validator: (value) {
                              if(value!.isNotEmpty){
                                return null;
                              }
                              else{
                                return "Please Enter Type Of Pet";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Type Of Pet",
                              suffixIcon: Icon(Icons.type_specimen_sharp),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey2,
                          child: TextFormField(
                            maxLength: 8,
                            controller: Pname,
                            validator: (value){
                              if(value!.isNotEmpty)
                              {
                                return null;
                              }
                              else
                              {
                                return "Please Enter Name Of Pet";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Name Of Pet",
                              suffixIcon: Icon(Icons.pets_outlined),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey3,
                          child: TextFormField(
                            maxLength: 2,
                            controller: Page,
                            validator: (value) {
                              if(value!.isNotEmpty)
                              {
                                return null;
                              }
                              else
                              {
                                return "Please Add Age Of Pet";
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Age Of Pet in Months",
                              suffixIcon: Icon(Icons.calendar_month_outlined),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey4,
                          child: TextFormField(
                            controller: Pgender,
                            validator: (value) {
                              if(value!.isNotEmpty){
                                return null;
                              }
                              else
                              {
                                return "Please Enter Gender Of Pet";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Gender of Pet",
                              suffixIcon: Icon(Icons.pets_sharp),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey5,
                          child: TextFormField(
                            maxLength: 7,
                            controller: Pcolour,
                            validator: (value) {
                              if(value!.isNotEmpty)
                              {
                                return null;
                              }
                              else{
                                return "Please Enter Colour Of Pet";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Colour Of Pet",
                              suffixIcon: Icon(Icons.color_lens),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),

                          child: Row(
                            children: [
                              IconButton(onPressed: ()async{
                                ImagePicker imagePicker=ImagePicker();
                                file= await imagePicker.pickImage(source: ImageSource.gallery);
                                _imageTemporary=File(file!.path);
                              }, icon: Icon(Icons.image,size: 30,)),
                              SizedBox(width: 5,),
                              IconButton(onPressed: ()async{
                                ImagePicker imagePicker=ImagePicker();
                                file= await imagePicker.pickImage(source: ImageSource.camera);
                                _imageTemporary=File(file!.path);
                              }, icon: Icon(Icons.camera,size: 30,)),
                              SizedBox(width: 100,),
                              Opacity(
                                opacity:pressed==false?1.0:0.2,
                                child: ElevatedButton(onPressed: () async{
                                  setState(() {
                                    pressed=!pressed;
                                    this._image=_imageTemporary;
                                  });
                                  if(file==null) return;

                                String FileName=DateTime.now().millisecondsSinceEpoch.toString();
                                Reference refRoot=FirebaseStorage.instance.ref();
                                Reference refDir=refRoot.child("Image");
                                Reference refImg=refDir.child(FileName);
                                try{
                                  await refImg.putFile(File(file!.path));
                                  imageurl=await refImg.getDownloadURL();
                                }
                                catch(error){
                                  //error
                                }
                                }, child: pressed==false?Text("Upload"):Text("Uploaded")),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey6,
                          child: TextFormField(
                            maxLength: 10,    
                            controller: Oname,           
                            validator: (value) {
                              if(value!.isNotEmpty)
                              {
                                return null;
                              }
                              else{
                                return "Please Enter Name Of Owner";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Name Of Owner (First Name)",
                              suffixIcon: Icon(Icons.person),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide:BorderSide(
                                  color: Colors.black,
                                  width: 2
                                ) 
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey7,
                          child: TextFormField(
                            controller: Ophone,
                            validator: (value) {
                              if(value!.isNotEmpty)
                              {
                                if(Ophone.text.length==10)
                                {
                                  return null;
                                }
                                else if(Ophone.text.length!=10)
                                {
                                  return "Please Enter 10 Digit Phone Number";
                                }
                              }
                              else
                              {
                                return "Please Enter Phone Number Of Owner";
                              }
                            },
                            
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Phone Number Of Owner",
                              suffixIcon: Icon(Icons.call),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Form(
                          key: _formkey8,
                          child: TextFormField(
                            maxLength: 20,
                            controller: Oaddress,
                            validator: (value) {
                              if(value!.isNotEmpty)
                              {
                                return null;
                              }
                              else{
                                return "Postal Address Of Owner";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Postal Address Of Owner",
                              suffixIcon: Icon(Icons.location_on),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                )
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                )
                              )
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 220,),
                            ElevatedButton(onPressed: (){

                              if(_formkey1.currentState!.validate()&&_formkey2.currentState!.validate()&&_formkey3.currentState!.validate()&&_formkey4.currentState!.validate()&&_formkey5.currentState!.validate()&&_formkey6.currentState!.validate()&&_formkey7.currentState!.validate()&&_formkey8.currentState!.validate()&& _image==null)
                              {
                                final text="Please Upload Image Of Pet";
                                final snackBar=SnackBar(content: Text(text));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                              else if(_formkey1.currentState!.validate()&&_formkey2.currentState!.validate()&&_formkey3.currentState!.validate()&&_formkey4.currentState!.validate()&&_formkey5.currentState!.validate()&&_formkey6.currentState!.validate()&&_formkey7.currentState!.validate()&&_formkey8.currentState!.validate()&& _image!=null)
                              {
                                setState(() {
                                pressed=false;
                                String pt=Ptype.text.toString();
                                String pn=Pname.text.toString();
                                String pa=Page.text.toString();
                                String pg=Pgender.text.toString();
                                String pc=Pcolour.text.toString();
                                String pi=imageurl.toString();
                                String on=Oname.text.toString();
                                String op=Ophone.text.toString();
                                String oa=Oaddress.text.toString();

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptionData(pt,pn,pa,pg,pc,pi,on,op,oa)));
                                 create();
                                 _image==null;
                                 Ptype.text="";
                                 Pname.text="";
                                 Page.text="";
                                 Pgender.text="";
                                 Pcolour.text="";
                                 Oname.text="";
                                 Ophone.text="";
                                 Oaddress.text="";
                              });
                              }

                              else
                              {
                                return;
                              }
                              
                            }, child: Text("Submit"))
                          ],
                        )
                      ],
                    ),
                  )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future create() async{
  final usercollection=FirebaseFirestore.instance.collection("Users");
  docref=usercollection.doc();
  await docref.set({
    "Type Of Pet":Ptype.text,
    "Name Of Pet":Pname.text,
    "Age Of Pet":Page.text,
    "Gender Of Pet":Pgender.text,
    "Colour Of Pet":Pcolour.text,
    "Image":imageurl.toString(),
    "Name Of Owner":Oname.text,
    "Phone Number Of Owner":Ophone.text,
    "Postal Address Of Owner":Oaddress.text,
  });
}