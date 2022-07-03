import 'package:flutter/material.dart';
import 'package:rofi_chat/detail_screen.dart';
import 'package:rofi_chat/side_menu.dart';
import 'package:rofi_chat/model/chat_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(103, 77, 77, 77),
        title: const Text("RofiChat"),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.search),
        //     splashRadius: 1,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: contacts.map(((Contact contact) {
            return Container(
                decoration: const BoxDecoration(
                  // color: Colors.black54,
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.transparent),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      contact.chatList.last.seenByUser = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(contact: contact))).then(
                        (value) => setState(
                          () {},
                        ),
                      );
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => ImageDialog(
                                name: contact.name, imgUrl: contact.imageUrl)),
                        icon: CircleAvatar(
                          backgroundImage: NetworkImage(contact.imageUrl),
                        ),
                        iconSize: 50,
                        splashRadius: 1,
                      ),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: contact.chatList.last.seenByUser
                                  ? ChatSeenByUser(contact: contact)
                                  : ChatNotSeenByUser(contact: contact)))
                    ],
                  ),
                ));
          })).toList(),
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String name;
  final String imgUrl;
  const ImageDialog({required this.name, required this.imgUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imgUrl), fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(133, 124, 124, 124),
            ),
            child: Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatSeenByUser extends StatelessWidget {
  final Contact contact;
  const ChatSeenByUser({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                contact.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                contact.chatList.last.time
                    .toString()
                    .split(" ")[1]
                    .split(":00")[0],
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              )
            ],
          ),
          // if owned by contact
          const SizedBox(height: 4),
          contact.chatList.last.ownedByContact
              ? OwnedByContact(contact: contact)
              : NotOwnedByContact(contact: contact)
        ]);
  }
}

class NotOwnedByContact extends StatelessWidget {
  final Contact contact;
  const NotOwnedByContact({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Icon(
        Icons.check,
        color: contact.chatList.last.seenByContact
            ? Colors.greenAccent
            : Colors.white70,
        size: 15,
      ),
      const SizedBox(width: 5),
      Flexible(
        child: Text(
          contact.chatList.last.message,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      ),
    ]);
  }
}

class OwnedByContact extends StatelessWidget {
  final Contact contact;
  const OwnedByContact({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Flexible(
        child: Text(
          contact.chatList.last.message,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
      )
    ]);
  }
}

class ChatNotSeenByUser extends StatelessWidget {
  final Contact contact;
  const ChatNotSeenByUser({required this.contact, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                contact.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                contact.chatList.last.time
                    .toString()
                    .split(" ")[1]
                    .split(":00")[0],
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Text(
                    contact.chatList.last.message,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 10,
                  child: Text(
                    contact.chatList
                        .where((Chat chat) => !chat.seenByUser)
                        .length
                        .toString(),
                    style: const TextStyle(
                        fontSize: 12, color: Color.fromARGB(255, 22, 22, 22)),
                  ),
                )
              ])
        ]);
  }
}
