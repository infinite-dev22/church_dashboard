import 'package:church_dashboard/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_graph.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_graph_holder.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiddleOverview extends StatelessWidget {
  const MiddleOverview({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (blocContext, state) {
        if (state.status.isInitial) {
          blocContext.read<DashboardBloc>().add(GetCountAllByDateJoined());
        }
        if (state.status.isLoading) {
          return _buildBody(screenHeight, blocContext, state);
        }
        if (state.status.isError) {
          return _buildBody(screenHeight, blocContext, state);
        }
        if (state.status.isSuccess) {
          return _buildBody(screenHeight, blocContext, state);
        }
        return _buildBody(screenHeight, blocContext, state);
      },
    );
  }

  Widget _buildBody(
      double screenHeight, BuildContext context, DashboardState state) {
    var newMembersData = state.groupedCount
        ?.map((count) => FlSpot(count.dateJoined, count.count))
        .toList();
    List<double>? counts =
        state.groupedCount?.map((count) => count.count).toList();
    var highest = 0.0;
    if (counts != null && counts.isNotEmpty) {
      highest =
          counts.reduce((current, next) => current > next ? current : next);
    }
    return SizedBox(
      height: screenHeight * .5,
      child: DashboardGraphHolder(
        graph: LineChartSample(newMembersData: newMembersData!, highest: highest),
      ),
    );
  }
}
