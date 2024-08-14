import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/people_repo.dart';

class RegistrationPageCubit extends Cubit<void> {
  RegistrationPageCubit() : super(0);

  var personRepo = PeopleRepo();
  Future<void> addPerson(String name , String phone) async {
    await personRepo.addPerson(name, phone);
  }
}
