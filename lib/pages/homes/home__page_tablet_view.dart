import 'package:flutter/material.dart';
import 'package:pppos/core/utilitys/theme.dart';
import 'package:pppos/custom_widgets/side_menu_item.dart';

class HomePageTabletView extends StatefulWidget {
  const HomePageTabletView({super.key});

  @override
  State<HomePageTabletView> createState() => _HomePageTabletViewState();
}

class _HomePageTabletViewState extends State<HomePageTabletView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(children: [
          //side menu
          SizedBox(
            width: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(color: AppTheme.backColor),
              child: Expanded(
                  child: Column(
                children: [
                  //logo
                  const SizedBox(
                    height: 75,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Image(
                        image: AssetImage("assets/images/logos/logo.png"),
                        fit: BoxFit.cover,
                        opacity: AlwaysStoppedAnimation(0.5),
                      ),
                    ),
                  ),
                  //pages
                  SideMenuItem(
                    selected: true,
                    icon: Icons.grid_view_rounded,
                  ),
                  SideMenuItem(
                    selected: false,
                    icon: Icons.table_restaurant_rounded,
                  ),
                  SideMenuItem(
                    selected: false,
                    icon: Icons.groups_rounded,
                  ),
                  SideMenuItem(
                    selected: false,
                    icon: Icons.dashboard_rounded,
                  ),

                  const Spacer(),

                  //settings - logout
                  SideMenuItem(
                    selected: false,
                    icon: Icons.settings_rounded,
                  ),
                  SideMenuItem(
                    selected: false,
                    icon: Icons.support_agent_rounded,
                  ),
                  SideMenuItem(
                    selected: false,
                    icon: Icons.login_rounded,
                  ),
                ],
              )),
            ),
          ),

          //body
          Expanded(
            child: Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              color: AppTheme.backColorSecondary,
              child: const Center(child: Text("Home body")),
            ),
          )
        ]),
      ),
    );
  }
}
