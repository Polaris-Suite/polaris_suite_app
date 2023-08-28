import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/view/project_details/settings_screens/collaboration_screen.dart';
import 'package:polaris_suite_app/view/project_details/settings_screens/detail_screen.dart';
import 'package:polaris_suite_app/view/project_details/settings_screens/notification_screen.dart';
import 'package:polaris_suite_app/view/screens/notification_screen.dart';

class SettingScreens extends StatefulWidget {
  const SettingScreens({super.key});

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            // horizontal: 25,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_literals_to_create_immutables
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.indigo.shade900,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: 'Details',
                    ),
                    Tab(
                      text: 'Collab.',
                    ),
                    Tab(
                      text: 'Notifi.',
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    DetailsScreen(),
                    CollaborationScreen(),
                    SettingsNotificaitonScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
