import 'package:contacts_app/data/entity/repo/persondao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPersonCubit extends Cubit<void> {
  NewPersonCubit() : super(0);

  var pRepo = PersonDaoRepository();

  Future<void> savePerson(String personName, String personPhone) async {
    pRepo.savePerson(personName, personPhone);
  }
}
