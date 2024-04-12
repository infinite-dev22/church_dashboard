import 'package:church_dashboard/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCardHolder extends StatelessWidget {
  final List<Widget> cards;

  const DashboardCardHolder({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => _buildBody(constraints),);
  }

  Widget _buildBody(BoxConstraints constraints) {
    return Container(width: constraints.maxWidth,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: constraints.maxWidth,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          children: cards,
        ),
      ),
    );
  }
}
