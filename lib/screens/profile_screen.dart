import 'package:flutter/material.dart';
import 'package:parentapp/widgets/profile_header.dart';
import 'package:parentapp/widgets/settings_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ProfileHeader(),
            SettingsList(),
          ],
        ),
      ),
    );
  }
}
