import 'package:flutter/material.dart';

class LocationServices {
  static final List<NearbyPlace> nearbyPlaces = [
    NearbyPlace(
      name: 'Manulife Insurance',
      type: 'Insurance',
      distance: '2.5 miles',
      rating: 4.5,
    ),
    NearbyPlace(
      name: 'Daycare Center',
      type: 'Childcare',
      distance: '0.8 miles',
      rating: 4.8,
    ),
    NearbyPlace(
      name: 'Family Restaurant',
      type: 'Restaurant',
      distance: '1.2 miles',
      rating: 4.3,
    ),
  ];

  static List<NearbyPlace> getNearbyPlaces() {
    return nearbyPlaces;
  }

  static IconData getIconForType(String type) {
    switch (type) {
      case 'Insurance':
        return Icons.business;
      case 'Childcare':
        return Icons.child_care;
      case 'Restaurant':
        return Icons.restaurant;
      default:
        return Icons.location_on;
    }
  }
}

class NearbyPlace {
  final String name;
  final String type;
  final String distance;
  final double rating;

  NearbyPlace({
    required this.name,
    required this.type,
    required this.distance,
    required this.rating,
  });
}