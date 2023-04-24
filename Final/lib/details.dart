import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({required this.id, Key? key}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection("ngos").doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;

        return Scaffold(
          appBar: AppBar(
            title: Text(data['name']),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.containsKey('image'))
                    Image.network(
                      data['image'],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        left: 25, bottom: 20, top: 16, right: 25),
                    decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Number 1: ${data['contactnumber1']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Contact Number 2: ${data['contactnumber2']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Email: ${data['email']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Address: ${data['address2']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'About Us: ${data['activities']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
