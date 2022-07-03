import 'package:flutter/material.dart';
import 'package:rofi_chat/model/chat_data.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://picsum.photos/201/203'),
                    ),
                    iconSize: 70,
                    splashRadius: 1,
                  ),
                  const Expanded(
                      child: Text("Fakhri C. Rofi",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                  Switch(
                      value: phoneUser.isOnline,
                      onChanged: (value) => setState(() {
                            phoneUser.isOnline = !phoneUser.isOnline;
                          })),
                  Text(
                    phoneUser.isOnline ? "on" : "off",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const Text(
                "Made with ♥ by Fakhri C. Rofi",
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ));
  }
}
