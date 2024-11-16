import 'package:flutter/material.dart';

class DemandChart extends StatelessWidget {
  const DemandChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Purchase Trends',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Center(
                child: Text('Chart placeholder'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}