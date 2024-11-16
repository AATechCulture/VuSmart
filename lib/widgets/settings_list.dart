import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSection('Account Settings', [
          _buildListTile(
            icon: Icons.person_outline,
            title: 'Personal Information',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.child_care,
            title: 'Children Profiles',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.notifications_outlined,
            title: 'Notification Preferences',
            onTap: () {},
          ),
        ]),
        _buildSection('Preferences', [
          _buildListTile(
            icon: Icons.restaurant_menu,
            title: 'Dietary Preferences',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.attach_money,
            title: 'Budget Settings',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.location_on_outlined,
            title: 'Location Settings',
            onTap: () {},
          ),
        ]),
        _buildSection('Support', [
          _buildListTile(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.logout,
            title: 'Log Out',
            onTap: () {},
          ),
        ]),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
