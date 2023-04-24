import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:semifin/details.dart';

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('ngos');

  //_reference.get()  ---> returns Future<QuerySnapshot>
  //_reference.snapshots()--> Stream<QuerySnapshot> -- realtime updates
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NGOs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;
            //Convert the documents to Maps
            List<Map> items = documents
                .map((e) => {
                      'id': e.id,
                      'aabt': e['activities'],
                      'name': e['name'],
                      'aimage': e['image'],
                      'acontact1': e['contactnumber1'],
                      'acontact2': e['contactnumber2'],
                      'add2': e['address2'],
                      'aemail': e['email']
                    })
                .toList();

            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];

                  //REturn the widget for the list items
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor: Colors.brown.shade50,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${thisItem['name']}, ${thisItem['add2']}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Contact no:${thisItem['acontact1']}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Contact no:${thisItem['acontact2']}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Email id :${thisItem['aemail']}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('About us:\n${thisItem['aabt']}'),
                        ],
                      ),
                      leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: thisItem.containsKey('aimage')
                              ? Image.network('${thisItem['aimage']}')
                              : Container()),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Details(id: thisItem["id"]),
                        ));
                      },
                    ),
                  );
                });
          }

          //Show loader
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
