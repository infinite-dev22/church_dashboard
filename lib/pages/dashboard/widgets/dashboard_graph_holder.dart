import 'package:church_dashboard/pages/dashboard/widgets/dashboard_graph.dart';
import 'package:church_dashboard/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardGraphHolder extends StatelessWidget {
  final LineChartSample graph;

  const DashboardGraphHolder({super.key, required this.graph});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(child: graph),
        ],
      ),
    );
  }
}
