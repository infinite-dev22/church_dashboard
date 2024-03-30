import 'package:church_dashboard/global_values.dart';
import 'package:church_dashboard/pages/people/bloc/people_bloc/people_bloc.dart';
import 'package:church_dashboard/pages/people/screens/people_page.dart';
import 'package:church_dashboard/pages/root/bloc/root_bloc.dart';
import 'package:church_dashboard/pages/root/screens/root_screen.dart';
import 'package:church_dashboard/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const ChurchDashboardApp());
}

class ChurchDashboardApp extends StatefulWidget {
  const ChurchDashboardApp({super.key});

  @override
  State<ChurchDashboardApp> createState() => _ChurchDashboardAppState();
}

class _ChurchDashboardAppState extends State<ChurchDashboardApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Church Dashboard',
        theme: ThemeData(
          primaryColor: AppColor.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          final page = _getPageWidget(settings);
          if (page != null) {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => page,
                transitionsBuilder: (_, anim, __, child) {
                  return FadeTransition(
                    opacity: anim,
                    child: MultiBlocProvider(
                      providers: [
                        BlocProvider<RootBloc>(
                          create: (_) => RootBloc(),
                        ),
                        BlocProvider<PeopleBloc>(
                          create: (_) => PeopleBloc(),
                        ),
                      ],
                      child: child,
                    ),
                  );
                });
          }
          return null;
        },
      ),
    );
  }

  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        currentRoute = '/';
        return const RootScreen();
      case '/people':
        currentRoute = '/people';
        return const PeoplePage();
    }
    return null;
  }
}
