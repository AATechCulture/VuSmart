import 'package:flutter/material.dart';

class MealRecommendation extends StatefulWidget {
  const MealRecommendation({Key? key}) : super(key: key);

  @override
  State<MealRecommendation> createState() => _MealRecommendationState();
}

class _MealRecommendationState extends State<MealRecommendation> {
  double _budget = 100;
  List<String> _selectedDiets = [];
  final List<String> _dietaryOptions = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Low-Carb',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBudgetSlider(),
        _buildDietaryFilters(),
        _buildWeeklyMealPlan(),
      ],
    );
  }

  Widget _buildBudgetSlider() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Budget: \$${_budget.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: _budget,
            min: 50,
            max: 300,
            divisions: 25,
            label: '\$${_budget.round()}',
            onChanged: (value) {
              setState(() {
                _budget = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDietaryFilters() {
    return Wrap(
      spacing: 8,
      children: _dietaryOptions.map((diet) {
        final isSelected = _selectedDiets.contains(diet);
        return FilterChip(
          label: Text(diet),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedDiets.add(diet);
              } else {
                _selectedDiets.remove(diet);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildWeeklyMealPlan() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        return _buildDayMealCard(index);
      },
    );
  }

  Widget _buildDayMealCard(int dayIndex) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text('Day ${dayIndex + 1}'),
        children: [
          _buildMealTile('Breakfast', 'Healthy Breakfast Option'),
          _buildMealTile('Lunch', 'Nutritious Lunch Meal'),
          _buildMealTile('Dinner', 'Balanced Dinner Option'),
        ],
      ),
    );
  }

  Widget _buildMealTile(String mealType, String suggestion) {
    return ListTile(
      title: Text(mealType),
      subtitle: Text(suggestion),
      trailing: IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          // Regenerate meal suggestion
        },
      ),
    );
  }
}
