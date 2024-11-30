import 'package:contacts_app/data/entity/person.dart';
import 'package:flutter/material.dart';

class PersonDetailsPage extends StatefulWidget {
  Person person;
  PersonDetailsPage({required this.person});

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  Future<void> updatePerson(
      int personID, String personName, String personPhone) async {
    print("update: $personID $personName $personPhone");
  }

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.personName;
    tfPersonPhone.text = person.personPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person Details"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(hintText: "Person name"),
              ),
              TextField(
                controller: tfPersonPhone,
                decoration: const InputDecoration(hintText: "Person phone"),
              ),
              ElevatedButton(
                  onPressed: () {
                    updatePerson(widget.person.personID, tfPersonName.text,
                        tfPersonPhone.text);
                  },
                  child: const Text("Update")),
            ],
          ),
        ),
      ),
    );
  }
}
