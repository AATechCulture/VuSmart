import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Services'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map_placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildNearbyLocation(
              'Manulife Insurance',
              '2.5 miles away',
              Icons.business,
            ),
            _buildNearbyLocation(
              'Daycare Center',
              '0.8 miles away',
              Icons.child_care,
            ),
            _buildNearbyLocation(
              'Family Restaurant',
              '1.2 miles away',
              Icons.restaurant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyLocation(String name, String distance, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(name),
        subtitle: Text(distance),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
