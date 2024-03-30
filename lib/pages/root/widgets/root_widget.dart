import 'package:church_dashboard/pages/dashboard/screens/dashboard_page.dart';
import 'package:church_dashboard/pages/people/screens/people_page.dart';
import 'package:church_dashboard/pages/root/bloc/root_bloc.dart';
import 'package:church_dashboard/pages/root/widgets/screen.dart';
import 'package:church_dashboard/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebar_with_animation/animated_side_bar.dart';

class CustomRootWidget extends StatelessWidget {
  const CustomRootWidget({super.key});

  Widget _buildBody(BuildContext blocContext, RootState state) {
    return Row(
      children: [
        SideBarAnimated(
          onTap: (index) {
            blocContext.read<RootBloc>().add(SwitchScreenEvent(index));
          },
          sideBarAnimationDuration: const Duration(milliseconds: 200),
          floatingAnimationDuration: const Duration(milliseconds: 200),
          // sideBarColor: Colors.white,
          // animatedContainerColor: Colors.white,
          widthSwitch: 700,
          mainLogoImage: 'assets/images/logo.png',
          sidebarItems: [
            SideBarItem(
              iconSelected: Icons.dashboard_rounded,
              iconUnselected: Icons.dashboard_outlined,
              text: 'Dashboard',
            ),
            SideBarItem(
              iconSelected: Icons.people_rounded,
              iconUnselected: Icons.people_outline,
              text: 'People',
            ),
          ],
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
              right: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: .1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: _buildRootViewStack(blocContext, state),
          ),
        ),
      ],
    );
  }

  List<Screen> _screens() {
    return [
      const Screen(
        index: 0,
        name: "Home",
        widget: DashboardPage(),
      ),
      const Screen(
        index: 1,
        name: "Employees",
        widget: PeoplePage(),
      ),
    ];
  }

  Widget _buildRootViewStack(blocContext, RootState state) {
    return IndexedStack(
      index: state.idSelected,
      children: List.generate(
        _screens().length,
        (index) => _screens()[index].widget ?? Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (blocContext, state) {
        return _buildBody(blocContext, state);
      },
    );
  }
}
