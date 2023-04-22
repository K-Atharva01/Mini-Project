import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:semifin/admininfo.dart';
import 'authcontroller.dart';

class admininfo extends StatefulWidget{
  @override
  State<admininfo> createState() => _admininfoState();
}

class _admininfoState extends State<admininfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController name3Controller = TextEditingController();
  TextEditingController aactController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contact1Controller = TextEditingController();
  TextEditingController contact2Controller = TextEditingController();
  TextEditingController contact3Controller = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController adateController = TextEditingController();
  AuthController admininfo = Get.put(AuthController());

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  uploadImage(File image) async {
    String imageUrl = '';
    String adminFile = Path.basename(image.path);
    var reference = FirebaseStorage.instance
        .ref()
        .child('ngos/$adminFile'); // Modify this path/string as your need
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
          (value) {
        imageUrl = value;
        print("Download URL: $value");
      },
    );

    return imageUrl;
  }

  storeAdminInfo() async {
    String url = await uploadImage(selectedImage!);
    String uid = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('ngos').doc(uid).set({
      'image': url,
      'name': nameController.text,
      'nameofhead1': name1Controller.text,
      'nameofhead2': name2Controller.text,
      'nameofhead3': name3Controller.text,
      'contactnumber1' : contact1Controller.text,
      'contactnumber2' : contact2Controller.text,
      'contactnumber3' : contact3Controller.text,
      'address1' : address1Controller.text,
      'address2' : address2Controller.text,
      'activities': aactController.text,
      'startdate' : adateController.text,
      'email': emailcontroller.text,

    }).then((value) {}
    );
  }

  bool isLoading = false;

  @override

  void initState(){
    super.initState();
    nameController.text = admininfo.myadmin.value.amainname??"";
    name1Controller.text = admininfo.myadmin.value.aname1??"";
    name2Controller.text = admininfo.myadmin.value.aname2??"";
    name3Controller.text = admininfo.myadmin.value.aname3??"";
    contact1Controller.text = admininfo.myadmin.value.acontact1??"";
    contact2Controller.text  = admininfo.myadmin.value.acontact2??"";
    contact3Controller.text = admininfo.myadmin.value.acontact3??"";
    address1Controller.text = admininfo.myadmin.value.add1??"";
    address2Controller.text = admininfo.myadmin.value.add2??"";
    aactController.text = admininfo.myadmin.value.aact??"";
    adateController.text = admininfo.myadmin.value.adate??"";
    emailcontroller.text = admininfo.myadmin.value.aemail??"";

  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.black) ,
        backgroundColor: Colors.white,
        title: Text('Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,

            )),
        centerTitle: true,

      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets1/profile4.jpg')
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: InkWell(
                    onTap: (){
                      getImage(ImageSource.gallery);
                    },
                    child: selectedImage ==null?admininfo.myadmin.value.aimage!=null? Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(admininfo.myadmin.value.aimage!),
                          ),
                          shape: BoxShape.circle,
                          color: Color(0xffD6D6D6)
                      ),
                    ):
                    Container(
                      width: 120,
                      height: 120,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                      ),
                      child: Center(
                          child: Icon(Icons.camera_alt_outlined, size:40,color: Colors.white,)
                      ),
                    ) :
                    Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(selectedImage!),
                          ),
                          shape: BoxShape.circle,
                          color: Color(0xffD6D6D6)
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    children: [
                      TextFieldWidget(
                          'Name', Icons.person_outlined, nameController,(String? input){

                        if(input!.isEmpty){
                          return 'Name is required!';
                        }


                        return null;

                      }),
                      SizedBox(
                        height: 10,
                      ),

                      TextFieldWidget(
                          'Name of head1', Icons.person_outlined, name1Controller,(String? input){

                        if(input!.isEmpty){
                          return 'Name1 is required!';
                        }


                        return null;

                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Name of head2', Icons.person_outlined, name2Controller,(String? input){

                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;

                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Name of head3', Icons.person_outlined, name3Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),

                      TextFieldWidget(
                          'EmailAddress', Icons.person_outlined, emailcontroller,(String? input){

                        if(input!.isEmpty){
                          return 'Name1 is required!';
                        }


                        return null;

                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'contact number1', Icons.person_outlined, contact1Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'contact number 2', Icons.person_outlined, contact2Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'contact number 3', Icons.person_outlined, contact3Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Address 1', Icons.person_outlined, address1Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Main Location', Icons.person_outlined, address2Controller,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'About you', Icons.person_outlined, aactController,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Start Date', Icons.person_outlined, adateController,(String? input){
                        if(input!.isEmpty){
                          return 'Contact no is required!';
                        }

                        return null;


                      }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent,
                        minimumSize: Size(200, 45),
                      ),
                          onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => adminprofile())
                            );
                            storeAdminInfo();
                          },
                          child: Text('Submit',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white,
                              )
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

Widget TextFieldWidget(
    String title, IconData iconData, TextEditingController controller,Function validator,{Function? onTap,bool readOnly = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.brown),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        width: Get.width,
        // height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          readOnly: readOnly,
          onTap: ()=> onTap!(),
          validator: (input)=> validator(input),
          controller: controller,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                iconData,
                color: Colors.brown,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      )
    ],
  );
}



