import 'package:flutter/material.dart';

class InvestmentRecommendations extends StatefulWidget {
  const InvestmentRecommendations({Key? key}) : super(key: key);

  @override
  State<InvestmentRecommendations> createState() => _InvestmentRecommendationsState();
}

class _InvestmentRecommendationsState extends State<InvestmentRecommendations> {
  double _riskTolerance = 2;
  double _monthlyInvestment = 500;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRiskAssessment(),
        _buildInvestmentSlider(),
        _buildPortfolioDistribution(),
        _buildRecommendedFunds(),
      ],
    );
  }

  Widget _buildRiskAssessment() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Risk Tolerance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _riskTolerance,
              min: 1,
              max: 5,
              divisions: 4,
              label: ['Very Low', 'Low', 'Moderate', 'High', 'Very High'][_riskTolerance.toInt() - 1],
              onChanged: (value) {
                setState(() {
                  _riskTolerance = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentSlider() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Investment: \${_monthlyInvestment.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _monthlyInvestment,
              min: 100,
              max: 5000,
              divisions: 49,
              onChanged: (value) {
                setState(() {
                  _monthlyInvestment = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioDistribution() {
    return SizedBox(
      height: 200,
      child: Container(), // Removed PieChart widget
    );
  }

  Widget _buildRecommendedFunds() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return _buildFundCard(index);
      },
    );
  }

  Widget _buildFundCard(int index) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text('Investment Fund ${index + 1}'),
        subtitle: Text('Expected Return: ${(index + 5)}%'),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text('Invest'),
        ),
      ),
    );
  }
}