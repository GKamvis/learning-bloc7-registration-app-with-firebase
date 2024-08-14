import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/people_repo.dart';

class UpdatePageCubit extends Cubit<void>{
  UpdatePageCubit() : super(0);
  var personRepo = PeopleRepo();
  Future<void> updatePerson(String id, String name, String phone) async {
    await personRepo.updatePerson(id, name, phone);
  }
}

