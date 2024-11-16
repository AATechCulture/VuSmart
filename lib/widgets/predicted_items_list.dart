import 'package:flutter/material.dart';

class PredictedItemsList extends StatelessWidget {
  const PredictedItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Predicted Demand',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildPredictedItem(
                  'Item ${index + 1}',
                  'Category ${index + 1}',
                  (index + 1) * 15,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPredictedItem(String name, String category, int percentage) {
    return ListTile(
      title: Text(name),
      subtitle: Text(category),
      trailing: CircularProgressIndicator(
        value: percentage / 100,
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
