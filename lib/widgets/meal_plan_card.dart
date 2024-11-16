import 'package:flutter/material.dart';

class MealPlanCard extends StatelessWidget {
  final int dayIndex;
  
  const MealPlanCard({Key? key, required this.dayIndex}) : super(key: key);

  String _getDayName(int index) {
    List<String> days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[index];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(_getDayName(dayIndex)),
        children: [
          ListTile(
            title: const Text('Breakfast'),
            subtitle: const Text('Oatmeal with fruits'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('Lunch'),
            subtitle: const Text('Grilled chicken salad'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: const Text('Dinner'),
            subtitle: const Text('Salmon with vegetables'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
