import 'package:flutter/material.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({Key? key}) : super(key: key);

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMap(),
        _buildNearbyList(),
      ],
    );
  }

  Widget _buildMap() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/map_placeholder.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildNearbyList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _nearbyBusinesses.length,
        itemBuilder: (context, index) {
          final business = _nearbyBusinesses[index];
          return _buildBusinessCard(business);
        },
      ),
    );
  }

  Widget _buildBusinessCard(NearbyBusiness business) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(
          business.type == 'Insurance' ? Icons.business : Icons.child_care,
          size: 32,
        ),
        title: Text(business.name),
        subtitle: Row(
          children: [
            const Icon(Icons.star, size: 16, color: Colors.amber),
            Text(' ${business.rating}'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('View Details'),
        ),
      ),
    );
  }
    final List<NearbyBusiness> _nearbyBusinesses = [
      NearbyBusiness(
        name: 'Manulife Insurance',
        type: 'Insurance',
        position: const Point<double>(33.7490, -84.3880),
        rating: 4.5,      ),
      NearbyBusiness(
        name: 'Daycare Center',
        type: 'Childcare',
        position: const Point<double>(33.7491, -84.3880),
        rating: 4.8,
      ),
    ];
  }

  class NearbyBusiness {
    final String name;
    final String type;
    final Point<double> position;
    final double rating;

    NearbyBusiness({
      required this.name,
      required this.type,
      required this.position,
      required this.rating,
    });
  }