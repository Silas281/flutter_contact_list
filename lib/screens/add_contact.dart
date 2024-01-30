import "package:contacts/utils/contact.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../utils/my_colors.dart";

class AddContactScreen extends ConsumerWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final length = ref.watch(contactsProvider).length;
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController numberCtrl = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.purple,
        //automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        title: const Text(
          "Add Contact",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            //color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: "Enter your Name",
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: numberCtrl,
              decoration: const InputDecoration(
                labelText: "Enter your number",
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    if (nameCtrl.text.isNotEmpty && numberCtrl.text.isNotEmpty)
                      {
                        ref.read(contactsProvider.notifier).addContact(Contact(
                            id: (length + 1).toString(),
                            name: nameCtrl.text,
                            number: numberCtrl.text)),
                        Navigator.of(context).pop()
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All fields are required!'),
                          ),
                        ),
                      }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: 150,
                    decoration: BoxDecoration(
                      color: MyColors.purple,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Add",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
