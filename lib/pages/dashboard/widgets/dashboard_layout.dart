import 'package:church_dashboard/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:church_dashboard/pages/dashboard/widgets/middle_overview.dart';
import 'package:church_dashboard/pages/dashboard/widgets/top_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TopOverview(),
          MiddleOverview(),
        ],
      ),
    );
  }
}
