// These models were simplified

class PhoneUser {
  bool isOnline;
  PhoneUser({required this.isOnline});
}

PhoneUser phoneUser = PhoneUser(isOnline: false);

class Contact {
  String name;
  String imageUrl;
  bool isActive;
  DateTime lastSeen;
  List<Chat> chatList;

  Contact(
      {required this.name,
      required this.imageUrl,
      required this.isActive,
      required this.lastSeen,
      required this.chatList});
}

class Chat {
  bool ownedByContact;
  bool seenByContact;
  bool seenByUser;

  /// [ownedByContact] it means that the message owner is the contact
  String message;
  DateTime time;

  Chat(
      {required this.ownedByContact,
      required this.seenByContact,
      required this.seenByUser,
      required this.message,
      required this.time});
}

DateTime getTime(int hour, int minute) => DateTime(2022, 6, 24, hour, minute);

// ChatList is sorted by time
List<Contact> contacts = [
  Contact(
      name: "Fakhri Catur Rofi",
      imageUrl: 'https://picsum.photos/200/200',
      isActive: true,
      lastSeen: DateTime.now(),
      chatList: <Chat>[
        Chat(
            ownedByContact: true,
            seenByContact: true,
            seenByUser: true,
            message: "Hi",
            time: getTime(4, 50)),
        Chat(
          ownedByContact: false,
          seenByContact: false,
          seenByUser: true,
          message: "Hello, what are you doing?",
          time: getTime(4, 52),
        ),
      ]),
  Contact(
      name: "Alexander The Great",
      imageUrl: 'https://picsum.photos/200/201',
      isActive: false,
      lastSeen: getTime(5, 30),
      chatList: <Chat>[
        Chat(
            ownedByContact: false,
            seenByContact: true,
            seenByUser: true,
            message: "Good bye",
            time: getTime(4, 50)),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: false,
          message: "I will sleep now",
          time: getTime(4, 52),
        ),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: false,
          message: "Good bye!",
          time: getTime(4, 52),
        ),
      ]),
  Contact(
      name: "Comrade Putin",
      imageUrl: 'https://picsum.photos/200/202',
      isActive: false,
      lastSeen: getTime(5, 40),
      chatList: <Chat>[
        Chat(
            ownedByContact: false,
            seenByContact: true,
            seenByUser: true,
            message: "I will attack moscow!",
            time: getTime(4, 50)),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: true,
          message: "How dare you",
          time: getTime(4, 52),
        ),
        Chat(
          ownedByContact: false,
          seenByContact: true,
          seenByUser: true,
          message: "I have a dragon from GOT",
          time: getTime(4, 55),
        ),
        Chat(
          ownedByContact: false,
          seenByContact: true,
          seenByUser: true,
          message:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam quis quam. Integer in sapien. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Proin mattis lacinia justo. ",
          time: getTime(4, 55),
        ),
      ]),
  Contact(
      name: "John F Kennedy",
      imageUrl: 'https://picsum.photos/201/201',
      isActive: false,
      lastSeen: getTime(5, 30),
      chatList: <Chat>[
        Chat(
            ownedByContact: false,
            seenByContact: true,
            seenByUser: true,
            message: "Nice to meet you!",
            time: getTime(4, 50)),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: true,
          message:
              "Nice to meet you too, I'm going to visit your country next month",
          time: getTime(4, 52),
        ),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: false,
          message: "I want fried rice there!",
          time: getTime(4, 53),
        ),
        Chat(
          ownedByContact: true,
          seenByContact: true,
          seenByUser: false,
          message:
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam quis quam. Integer in sapien. Mauris dolor felis, sagittis at, luctus sed, aliquam non, tellus. Proin mattis lacinia justo. ",
          time: getTime(4, 53),
        ),
      ]),
];
