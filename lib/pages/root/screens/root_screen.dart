import 'package:church_dashboard/pages/root/widgets/root_widget.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomRootWidget());
  }
}
