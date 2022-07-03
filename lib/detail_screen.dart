import 'package:flutter/material.dart';
import 'package:rofi_chat/model/chat_data.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class DetailScreen extends StatefulWidget {
  final Contact contact;
  const DetailScreen({required this.contact, super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(103, 77, 77, 77),
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(widget.contact.name),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              splashRadius: 20,
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Column(children: [
              const SizedBox(height: 3),
              ...widget.contact.chatList.map((Chat chat) {
                return BubbleSpecialThree(
                  text: chat.message,
                  color: chat.ownedByContact
                      ? const Color(0xFFE8E8EE)
                      : const Color(0xFF1B97F3),
                  textStyle: TextStyle(
                      color: chat.ownedByContact ? Colors.black : Colors.white,
                      fontSize: 16),
                  isSender: !chat.ownedByContact,
                  tail: false,
                );
              }),
            ])),
            Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 5,
                        top: 5,
                        left: 5,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 25,
                            maxHeight: 135,
                            maxWidth: MediaQuery.of(context).size.width - 65),
                        child: Scrollbar(
                          child: TextField(
                            controller: myController,
                            style: const TextStyle(color: Colors.white70),
                            cursorColor: Colors.red,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              hintText: "Type your message",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() {
                        widget.contact.chatList.add(Chat(
                            message: myController.text,
                            ownedByContact: false,
                            seenByContact: false,
                            time: getTime(
                                DateTime.now().hour, DateTime.now().minute),
                            seenByUser: true));
                        myController.clear();
                      }),
                      icon: const CircleAvatar(
                        backgroundColor: Colors.black38,
                        child: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                      ),
                      iconSize: 40,
                      splashRadius: 20,
                    )
                  ],
                )),
          ],
        ));
  }
}
