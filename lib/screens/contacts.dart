// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import "package:contacts/screens/add_contact.dart";
import "package:contacts/screens/edit_contact.dart";
import "package:contacts/utils/contact.dart";
import "package:contacts/utils/my_colors.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ContactsScreen extends ConsumerWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        title: const Text(
          "Contact List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Contacts Title
            Text(
              "Contacts(${contacts.length.toString()})",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            //Search Bar
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(
                  Icons.search_outlined,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
              ),
            ),
            //Contacts List
            const SizedBox(
              height: 10,
            ),

            Expanded(
                child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) => Card(
                elevation: 0,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      contacts[index].name[0],
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contacts[index].name.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${contacts[index].number.toString()}"),
                    ],
                  ),
                  trailing: SizedBox(
                    width: 80,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async => {
                            ref.read(indexProvider.notifier).state =
                                contacts[index].id,
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditContactScreen(),
                              ),
                            ),
                          },
                          child: Icon(
                            Icons.edit,
                            color: MyColors.purple,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => {
                            ref
                                .read(contactsProvider.notifier)
                                .removeContact(contacts[index].id)
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.red[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddContactScreen(),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
