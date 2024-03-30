import 'package:church_dashboard/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_card.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_card_holder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopOverview extends StatelessWidget {
  const TopOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (blocContext, state) {
        if(state.status.isInitial){
          blocContext.read<DashboardBloc>().add(GetCountAll());
          blocContext.read<DashboardBloc>().add(GetCountAllInactive());
          blocContext.read<DashboardBloc>().add(GetCountAllNew());
        }
        if(state.status.isLoading){
          return _buildBody(blocContext, state);
        }
        if(state.status.isError){
          return _buildBody(blocContext, state);
        }
        if(state.status.isSuccess){
          return _buildBody(blocContext, state);
        }
        return _buildBody(blocContext, state);
      },
    );
  }

  Widget _buildBody(BuildContext context, DashboardState state) {
    return DashboardCardHolder(
      cards: [
        DashboardCard(title: 'Active Members', data: '${state.count ?? 0}'),
        const Spacer(),
        DashboardCard(title: 'New Members', data: '${state.newCount ?? 0}'),
        const Spacer(),
        DashboardCard(
            title: 'Cancelled Members', data: '${state.inactiveCount ?? 0}'),
      ],
    );
  }
}
