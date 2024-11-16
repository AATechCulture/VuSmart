import 'package:flutter/material.dart';

class MilesTracker extends StatelessWidget {
  const MilesTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Travel Miles Earned',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          const SizedBox(height: 8),
          const Text('7,000 / 10,000 miles'),
        ],
      ),
    );
  }
}
