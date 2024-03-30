import 'package:flutter/cupertino.dart';

class PeopleLoadingWidget extends StatelessWidget {
  const PeopleLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(radius: 20),
    );
  }
}
