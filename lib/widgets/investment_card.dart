import 'package:flutter/material.dart';

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recommended Portfolio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildInvestmentOption(
                    'Low Risk',
                    '40%',
                    Colors.green,
                  ),
                ),
                Expanded(
                  child: _buildInvestmentOption(
                    'Medium Risk',
                    '35%',
                    Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildInvestmentOption(
                    'High Risk',
                    '25%',
                    Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentOption(String title, String percentage, Color color) {
    return Column(
      children: [
        Text(title),
        const SizedBox(height: 8),
        CircularProgressIndicator(
          value: double.parse(percentage.replaceAll('%', '')) / 100,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        const SizedBox(height: 8),
        Text(percentage),
      ],
    );
  }
}
