class PersonDaoRepository {
  Future<void> savePerson(String personName, String personPhone) async {
    print("save: $personName $personPhone");
  }
}
