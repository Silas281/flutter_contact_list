import 'package:riverpod/riverpod.dart';

class Contact {
  String id;
  String name;
  String number;

  Contact({required this.id, required this.name, required this.number});

  Contact copyWith({String? id, String? name, String? number}) {
    return Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number);
  }
}

class ContactsNotifier extends StateNotifier<List<Contact>> {
  ContactsNotifier()
      : super([
          Contact(id: "1", name: "Silas", number: "0542893998"),
          Contact(id: "2", name: "Gideon", number: "0543669567"),
          Contact(id: "3", name: "Kasim", number: "0242897648"),
          Contact(id: "4", name: "Solomon", number: "0500000085"),
        ]);

  void addContact(Contact contact) {
    state = [...state, contact];
  }

  void removeContact(String id) {
    state = [
      for (final Contact c in state)
        if (c.id != id) c
    ];
  }

  void updateContact(String? id, String? name, String? number) {
    state = [
      for (final Contact c in state)
        if (c.id == id) c.copyWith(id: id, name: name, number: number) else c
    ];
  }

  Contact getContact(id) {
    for (final Contact c in state) {
      if (c.id == id) return c;
    }
    throw Exception('Contact not found');
  }
}

final contactsProvider = StateNotifierProvider<ContactsNotifier, List<Contact>>(
    (ref) => ContactsNotifier());

final indexProvider = StateProvider<String>((ref) => "");
