import 'package:contacts_app/data/entity/person.dart';
import 'package:contacts_app/ui/views/new_person.dart';
import 'package:contacts_app/ui/views/person_details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSearch = false;

  Future<void> search(String searchKey) async {
    print("searhing: $searchKey");
  }

  Future<List<Person>> loadContacts() async {
    var contactsList = <Person>[];
    var p1 =
        Person(personID: 1, personName: "Deniz", personPhoneNumber: "1234");
    var p2 =
        Person(personID: 2, personName: "Utku", personPhoneNumber: "12345");
    var p3 =
        Person(personID: 3, personName: "Burak", personPhoneNumber: "123456");
    contactsList.add(p1);
    contactsList.add(p2);
    contactsList.add(p3);
    return contactsList;
  }

  Future<void> delete(int personID) async {
    print("deleting: $personID");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Search.."),
                onChanged: (val) {
                  search(val);
                },
              )
            : const Text("Contacts App"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Person>>(
        future: loadContacts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var contactsList = snapshot.data;
            return ListView.builder(
              itemCount: contactsList!.length,
              itemBuilder: (context, index) {
                var person = contactsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonDetailsPage(
                                  person: person,
                                ))).then((value) {
                      print("returned homepage");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  person.personName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(person.personPhoneNumber),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "should ${person.personName} be deleted?"),
                                    action: SnackBarAction(
                                        label: "Yes",
                                        onPressed: () {
                                          delete(person.personID);
                                        }),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black54,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NewPersonPage())).then((value) {
            print("returned homepage");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
