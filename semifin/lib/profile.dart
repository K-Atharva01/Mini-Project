import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:semifin/homepage.dart';
import 'package:semifin/mainprofile.dart';
import 'authcontroller.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  AuthController authController = Get.put(AuthController());

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
    String fileName = Path.basename(image.path);
    var reference = FirebaseStorage.instance
        .ref()
        .child('users/$fileName'); // Modify this path/string as your need
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

  storeUserInfo() async {
    String url = await uploadImage(selectedImage!);
    // String uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      if (user.user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.user!.uid)
            .set({
          'image': url,
          'email': emailController.text,
          'name': nameController.text,
          'age': ageController.text,
          'contact': contactController.text,
          'bio': bioController.text,
        });

        setState(() {
          isLoading = false;
        });

        emailController.clear();
        nameController.clear();
        ageController.clear();
        contactController.clear();
        bioController.clear();
        passwordController.clear();
        // Get.to(() => homepage());
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => homepage()));
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    passwordController.text = authController.myuser.value.fpass ?? "";
    emailController.text = authController.myuser.value.femail ?? "";
    nameController.text = authController.myuser.value.fname ?? "";
    ageController.text = authController.myuser.value.fage ?? "";
    contactController.text = authController.myuser.value.fcontact ?? "";
    bioController.text = authController.myuser.value.fbio ?? "";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
                  fit: BoxFit.cover, image: AssetImage('assets/profile4.jpg'))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: InkWell(
                    onTap: () {
                      getImage(ImageSource.gallery);
                    },
                    child: selectedImage == null
                        ? authController.myuser.value.fimage != null
                            ? Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          authController.myuser.value.fimage!),
                                    ),
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                              )
                            : Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 40,
                                  color: Colors.white,
                                )),
                              )
                        : Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(selectedImage!),
                                ),
                                shape: BoxShape.circle,
                                color: Color(0xffD6D6D6)),
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
                          'Email', Icons.person_outlined, emailController,
                          (String? input) {
                        if (input!.isEmpty && !input.contains("@")) {
                          return 'Email is required!';
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Password', Icons.person_outlined, passwordController,
                          (String? input) {
                        if (input!.isEmpty && input.length < 8) {
                          return 'Password is Invalid!';
                        }
                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Name', Icons.person_outlined, nameController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'Name is required!';
                        }

                        return null;
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Age', Icons.person_outlined, ageController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'Age is required!';
                        }

                        return null;
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Contact', Icons.person_outlined, contactController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'Contact no is required!';
                        }

                        return null;
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          'Bio', Icons.person_outlined, bioController,
                          (String? input) {
                        if (input!.isEmpty) {
                          return 'Tell us something bout you';
                        }

                        return null;
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            minimumSize: Size(200, 45),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mainprofile()));
                            storeUserInfo();
                          },
                          child: Text('Submit',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white,
                              )))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

Widget TextFieldWidget(String title, IconData iconData,
    TextEditingController controller, Function validator,
    {Function? onTap, bool readOnly = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.brown),
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
          onTap: () => onTap!(),
          validator: (input) => validator(input),
          controller: controller,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
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
