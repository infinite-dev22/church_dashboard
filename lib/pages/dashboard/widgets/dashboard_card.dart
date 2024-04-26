import 'package:church_dashboard/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String data;

  const DashboardCard({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        right: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(20),
      color: AppColor.white,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
