import 'package:flutter/cupertino.dart';
import 'package:church_dashboard/theme/colors.dart';

class PeopleErrorWidget extends StatelessWidget {
  const PeopleErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while loading people",
        style: TextStyle(color: AppColor.red),
      ),
    );
  }
}
