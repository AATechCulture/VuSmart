import 'package:flutter/material.dart';
import 'package:parentapp/widgets/meal_plan_card.dart';
class MealPlanningScreen extends StatelessWidget {
  const MealPlanningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planning'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 7, // Days of the week
              itemBuilder: (context, index) {
                return MealPlanCard(dayIndex: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
