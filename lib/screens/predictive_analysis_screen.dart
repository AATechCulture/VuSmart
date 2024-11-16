import 'package:flutter/material.dart';
import 'package:parentapp/widgets/demand_chart.dart';
import 'package:parentapp/widgets/trending_products.dart';

class PredictiveAnalysisScreen extends StatelessWidget {
  const PredictiveAnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demand Analysis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DemandChart(),
            const SizedBox(height: 24),
            TrendingProducts(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}