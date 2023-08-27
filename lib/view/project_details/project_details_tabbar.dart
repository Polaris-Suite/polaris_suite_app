import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/view/project_details/activities_screen.dart';
import 'package:polaris_suite_app/view/project_details/environment_screen.dart';
import 'package:polaris_suite_app/view/project_details/settings_screen.dart';
import 'package:polaris_suite_app/view/project_details/testcase_screen.dart';

class ProjectDetailsTabBarScreen extends StatefulWidget {
  const ProjectDetailsTabBarScreen({super.key, required this.appTitle});
  final String? appTitle;

  @override
  State<ProjectDetailsTabBarScreen> createState() => _ProjectDetailsTabBarScreenState();
}

class _ProjectDetailsTabBarScreenState extends State<ProjectDetailsTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 9,
            ),
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.indigo.shade200,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const BackButton(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          title: Text(
            widget.appTitle.toString().toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
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
                    borderRadius: BorderRadius.circular(5), color: Colors.grey.shade300),
                child: const TabBar(
                  labelColor: AppColors.primaryColor,
                  indicatorColor: AppColors.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.engineering_sharp,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.text_fields_sharp,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.settings,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.work_history,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    EnvironmentScreen(),
                    TestCaseScreens(),
                    SettingScreens(),
                    ActivitiesScreen(),
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
