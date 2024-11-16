import 'package:flutter/material.dart';

class NearbyNotification extends StatelessWidget {
  final String businessName;
  final VoidCallback onTap;

  const NearbyNotification({
    Key? key,
    required this.businessName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text('You are near $businessName!'),
        subtitle: const Text('Click to view on map'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
