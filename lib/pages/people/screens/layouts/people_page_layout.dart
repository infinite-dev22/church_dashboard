import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:church_dashboard/pages/people/bloc/people_bloc/people_bloc.dart';
import 'package:church_dashboard/pages/people/widgets/error/people_error_widget.dart';
import 'package:church_dashboard/pages/people/widgets/initial/people_initial_widget.dart';
import 'package:church_dashboard/pages/people/widgets/loading/people_loading_widget.dart';
import 'package:church_dashboard/pages/people/widgets/success/people_success_widget.dart';

class PeoplePageLayout extends StatelessWidget {
  const PeoplePageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        if (state.status == PeopleStatus.initial) {
          context.read<PeopleBloc>().add(GetPeople());
        } else if (state.status == PeopleStatus.success) {
          return const SingleChildScrollView(
            child: PeopleSuccessWidget(),
          );
        } else if (state.status == PeopleStatus.loading) {
          return const PeopleLoadingWidget();
        } else if (state.status == PeopleStatus.error) {
          return const PeopleErrorWidget();
        }
        return const PeopleInitialWidget();
      },
    );
  }
}
