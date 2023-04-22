import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:semifin/example.dart';

class sendmail extends StatefulWidget{
  
  @override
  State<sendmail> createState() => _sendmailState();
}

class _sendmailState extends State<sendmail> {
  final _key = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController subject = TextEditingController();

  TextEditingController body = TextEditingController();

  sendEmail(String subject, String body, String recipientemail) async{

    final Email email = Email(
      body: body,
      subject: subject,
      recipients: [recipientemail],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.black) ,
        backgroundColor: Colors.amber,
        title: Text('Mail ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,

            )),
        centerTitle: true,

      ),
      body: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      ElevatedButton( style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                        minimumSize: Size(400, 45),
                      ),
                        onPressed:
                            (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ItemList())
                              );

                            },
                        child:
                        Text('See Listed NGOs'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'enter email id',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: subject,
                  decoration: InputDecoration(
                    hintText: 'enter subject',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: body,
                  decoration: InputDecoration(
                    hintText: 'enter address and description:',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton( style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  minimumSize: Size(200, 45),
                ),
                    onPressed:
                        (){
                      _key.currentState!.save();
                      print('${email.text}');
                      sendEmail(subject.text, body.text, email.text);
                        },
                    child:
                    Text('Send'))
              ],
            ),
          ),

    );
  }
}