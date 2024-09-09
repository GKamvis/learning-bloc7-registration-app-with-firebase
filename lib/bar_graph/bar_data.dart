import 'package:myapp/bar_graph/invidual_bargraph.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  BarData({
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
  });
  List<InvidualBargraph> barData = [];

  void initializeBarData() {
    barData = [
      InvidualBargraph(x: 1, y: monAmount),
      InvidualBargraph(x: 2, y: tueAmount),
      InvidualBargraph(x: 3, y: wedAmount),
      InvidualBargraph(x: 4, y: thuAmount),
      InvidualBargraph(x: 5, y: friAmount),
      InvidualBargraph(x: 6, y: satAmount),
      InvidualBargraph(x: 7, y: sunAmount),
    ];
  }
}
