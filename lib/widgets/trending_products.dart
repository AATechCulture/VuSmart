import 'package:flutter/material.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending This Week',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildTrendingItem(
                    'Product ${index + 1}',
                    '${(index + 1) * 10}% increase',
                    Icons.trending_up,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingItem(String name, String trend, IconData icon) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.shopping_bag, size: 40),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              Text(trend, style: const TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
