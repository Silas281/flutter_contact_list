import "package:contacts/utils/contact.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../utils/my_colors.dart";

class EditContactScreen extends ConsumerWidget {
  // Rest of the code...

  const EditContactScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController numberCtrl = TextEditingController();

    final id = ref.watch(indexProvider);
    final contact = ref.read(contactsProvider.notifier).getContact(id);
    nameCtrl.text = contact.name;
    numberCtrl.text = contact.number;
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: MyColors.purple,
        foregroundColor: Colors.white,
        title: const Text(
          "Edit Contact",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              color: MyColors.purple,
              height: 200,
              padding: const EdgeInsets.all(50),
              width: double.infinity,
              child: CircleAvatar(
                radius: 5,
                child: Text(
                  nameCtrl.text[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
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
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {
                    ref
                        .read(contactsProvider.notifier)
                        .updateContact(id, nameCtrl.text, numberCtrl.text),
                    Navigator.of(context).pop(),
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
                      "Update",
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
