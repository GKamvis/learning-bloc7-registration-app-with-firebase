import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class PeopleRepo {
  var collectionPeople = FirebaseFirestore.instance.collection('People');

  Future<void> addPerson(String name, String phone) async {
    var newPerson = HashMap<String, dynamic>();
    newPerson['id'] = "";
    newPerson['name'] = name;
    newPerson['phone'] = phone;

     await collectionPeople.add(newPerson);

  }

  Future<void> updatePerson(String id, String name, String phone) async {
    var updatedPerson = HashMap<String, dynamic>();
    updatedPerson['name'] = name;
    updatedPerson['phone'] = phone;

    await collectionPeople.doc(id).update(updatedPerson);
  }

  Future<void> deletePerson(String id) async {
    await collectionPeople.doc(id).delete();
  }


}
