import 'package:church_dashboard/pages/dashboard/widgets/dashboard_card.dart';
import 'package:church_dashboard/pages/dashboard/widgets/dashboard_card_holder.dart';
import 'package:flutter/cupertino.dart';

class TopOverview extends StatelessWidget {
  const TopOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return const DashboardCardHolder(
      cards: [
        DashboardCard(title: 'Active Members', data: '678'),
        Spacer(),
        DashboardCard(title: 'New Members', data: '256'),
        Spacer(),
        DashboardCard(title: 'Cancelled Members', data: '12'),
      ],
    );
  }
}
