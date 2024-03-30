import 'package:church_dashboard/data_source/models/person_model.dart';
import 'package:flutter/material.dart';

class ClientDetailSuccessDesktop extends StatelessWidget {
  const ClientDetailSuccessDesktop({
    super.key,
    required this.person,
  });

  final PersonModel person;

  @override
  Widget build(BuildContext context) {
    return _buildBody(context, person);
  }

  Widget _buildBody(BuildContext context, PersonModel person) {
    return const Placeholder();
  }
}
