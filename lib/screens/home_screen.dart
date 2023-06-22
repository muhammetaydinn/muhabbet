//home screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/utils/theme_data.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contact_list");
        },
        child: const Icon(Icons.message_outlined),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == create_group) {
                // goCreateGroupScreen();
              } else if (value == join_group) {
                // goJoinGroupScreen();
              } else if (value == settings) {
                Get.toNamed("/settings");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                popUpItem(create_group),
                popUpItem(join_group),
                popUpItem(settings)
              ];
            },
          )
        ],
        title: const Text('Muhabbet', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Get.toNamed("/chat_screen"),
              // whatsapp clone
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              ),
              title: const Text('Title'),
              subtitle: const Text('Subtitle'),
              trailing: index % 4 == 0
                  ? Icon(
                      Icons.lock_outlined,
                      color: primaryColor,
                    )
                  : index % 3 == 0
                      ? Icon(
                          Icons.timelapse_sharp,
                          color: primaryColor,
                        )
                      : null,
            );
          }))
        ],
      )),
    );
  }
}

PopupMenuItem<String> popUpItem(String value) {
  return PopupMenuItem<String>(
    value: value,
    child: Text(
      value,
    ),
  );
}
