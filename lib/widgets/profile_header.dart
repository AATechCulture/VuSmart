import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://placeholder.com/user.jpg'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Sarah Johnson',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Parent of 2',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          _buildStats(),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('Travel Miles', '7,000'),
        _buildStatItem('Orders', '24'),
        _buildStatItem('Saved Meals', '15'),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
