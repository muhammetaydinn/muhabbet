import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/login_controller.dart';
import 'package:muhabbet/utils/theme_data.dart';
import 'package:share_plus/share_plus.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});
  void shareMessage() {
    LoginController loginController = Get.put(LoginController());

    String id = loginController.loginModel.value.data!.id.toString();
    Share.share(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Row(
              children: [
                Text('Choose Contact'),
              ],
            ),
            Row(
              children: [
                Text(
                  '256 contacts',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            //add 3 listtile to listview
            return index == 0
                ? Column(
                    children: [
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 20,
                          child: const Icon(
                            Icons.group_add_outlined,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('New Group'),
                      ),
                      ListTile(
                        onTap: () => Get.toNamed("/new_contact"),
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 20,
                          child: const Icon(
                            Icons.person_add_outlined,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('New Contact'),
                      ),
                      ListTile(
                        onTap: () {
                          shareMessage();
                        },
                        leading: CircleAvatar(
                          backgroundColor: primaryColor,
                          radius: 20,
                          child: const Icon(
                            Icons.share_outlined,
                            color: Colors.black,
                          ),
                        ),
                        title: const Text('Invite Friends'),
                      ),
                      contactTile(index),
                    ],
                  )
                : contactTile(index);
          }))
        ],
      )),
    );
  }

  ListTile contactTile(int index) {
    return ListTile(
      // whatsapp clone
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
      ),
      title: Text('$index Title'),
      subtitle: const Text('Subtitle'),
      trailing: index % 4 == 0
          ? const Icon(
              Icons.lock_outlined,
              color: Colors.red,
            )
          : null,
    );
  }
}
