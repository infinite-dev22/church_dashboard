import 'package:church_dashboard/pages/dashboard/widgets/dashboard_graph.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_graph_holder.dart';
import 'package:flutter/cupertino.dart';

class MiddleOverview extends StatelessWidget {
  const MiddleOverview({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return _buildBody(screenHeight);
  }

  Widget _buildBody(double screenHeight) {
    return SizedBox(
      height: screenHeight * .5,
      child: const DashboardGraphHolder(
        graph: LineChartSample1(),
      ),
    );
  }
}
