import 'package:flutter/material.dart';

class InsuranceRecommendations extends StatefulWidget {
  const InsuranceRecommendations({Key? key}) : super(key: key);

  @override
  State<InsuranceRecommendations> createState() => _InsuranceRecommendationsState();
}

class _InsuranceRecommendationsState extends State<InsuranceRecommendations> {
  int _dependents = 2;
  double _annualIncome = 75000;
  int _age = 35;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPersonalInfoSection(),
        _buildCoverageCalculator(),
        _buildRecommendedPlans(),
      ],
    );
  }

  Widget _buildPersonalInfoSection() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildAgeSlider(),
            _buildDependentsCounter(),
            _buildIncomeSlider(),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Age: $_age'),
        Slider(
          value: _age.toDouble(),
          min: 18,
          max: 70,
          divisions: 52,
          onChanged: (value) {
            setState(() {
              _age = value.toInt();
            });
          },
        ),
      ],
    );
  }

  Widget _buildDependentsCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Number of Dependents:'),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (_dependents > 0) {
                  setState(() {
                    _dependents--;
                  });
                }
              },
            ),
            Text('$_dependents'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _dependents++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIncomeSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Annual Income: \$${_annualIncome.toStringAsFixed(0)}'),
        Slider(
          value: _annualIncome,
          min: 30000,
          max: 200000,
          divisions: 34,
          onChanged: (value) {
            setState(() {
              _annualIncome = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCoverageCalculator() {
    final recommendedCoverage = _annualIncome * 10;
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended Coverage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${recommendedCoverage.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendedPlans() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildPlanCard(index);
      },
    );
  }

  Widget _buildPlanCard(int index) {
    final plans = [
      'Basic Term Life',
      'Whole Life Insurance',
      'Universal Life Insurance',
    ];
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(plans[index]),
        subtitle: Text('Monthly Premium: \$${(index + 1) * 50}'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Learn More'),
        ),
      ),
    );
  }
}
