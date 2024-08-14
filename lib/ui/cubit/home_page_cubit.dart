import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/data/entity/people.dart';

import '../../data/repo/people_repo.dart';

class HomePageCubit extends Cubit<List<People>> {
  HomePageCubit() : super([]);

  var personRepo = PeopleRepo();
  var collectionPeople = FirebaseFirestore.instance.collection('People');

  Future<void> getPerson() async {
    collectionPeople.snapshots().listen((event) {
      var personList = <People>[];
      var documents = event.docs;
      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var person = People.fromJson(data, key);
        personList.add(person);
      }

      emit(personList);
    });
  }

  Future<void> deletePerson(String id) async {}

  Future<void> findPerson(String query) async {
    collectionPeople.snapshots().listen((event) {
      var personList = <People>[];
      var documents = event.docs;
      for (var document in documents) {
        var key = document.id;
        var data = document.data();
        var person = People.fromJson(data, key);

        if (person.name.toLowerCase().contains(query.toLowerCase())) {
          personList.add(person);
        }
      }
      emit(personList);
    });
  }
}
