import 'package:flutter/material.dart';
import 'package:parentapp/widgets/product_grid.dart';
import 'package:parentapp/widgets/miles_tracker.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Show notifications
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          MilesTracker(),
          Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.chat),
        onPressed: () {
          // Show chatbot
        },
      ),
    );
  }
}
