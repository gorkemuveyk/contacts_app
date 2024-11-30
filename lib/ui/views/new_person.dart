import 'package:flutter/material.dart';

class NewPersonPage extends StatefulWidget {
  const NewPersonPage({super.key});

  @override
  State<NewPersonPage> createState() => _NewPersonPageState();
}

class _NewPersonPageState extends State<NewPersonPage> {
  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();

  Future<void> savePerson(String personName, String personPhone) async {
    print("save: $personName $personPhone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Person"),
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
                    savePerson(tfPersonName.text, tfPersonPhone.text);
                  },
                  child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
