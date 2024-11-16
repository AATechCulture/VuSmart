import 'package:flutter/material.dart';
import 'package:parentapp/widgets/investment_card.dart';
import 'package:parentapp/widgets/insurance_recommendations.dart';
import 'package:flutter/material.dart';
import 'package:parentapp/widgets/investment_card.dart';
import 'package:parentapp/widgets/insurance_recommendations.dart';

class FinancialDashboardScreen extends StatelessWidget {
  const FinancialDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Investment Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),              SizedBox(height: 24),
              InvestmentCard(),
              SizedBox(height: 24),
              Text(
                'Insurance Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              InsuranceRecommendations(),
            ],
          ),
        ),
      ),
    );
  }
}
