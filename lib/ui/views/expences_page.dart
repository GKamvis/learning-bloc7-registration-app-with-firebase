import 'package:flutter/material.dart';
import 'package:myapp/bar_graph/bar_graph.dart';

class ExpencesPage extends StatefulWidget {
  const ExpencesPage({super.key});

  @override
  State<ExpencesPage> createState() => _ExpencesPageState();
}

class _ExpencesPageState extends State<ExpencesPage> {
  List<double> weeklySummary = [
    50,
    30.6,
    90.5,
    40.5,
    5.5,
    0.5,
    7.5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(
                  child: MyBarGraph(
          weeklySummary: weeklySummary,
                  ),
                  height: 200,
                ),
        ],
      ),
    );
  }
}
