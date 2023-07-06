import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/view/screens/document_explore_screen.dart';
// import 'package:polaris_suite_app/view/screens/explore_document_screen.dart';
import 'package:polaris_suite_app/view/screens/home_screens.dart';
import 'package:polaris_suite_app/view/screens/notification_screen.dart';
import 'package:polaris_suite_app/view/screens/profile_screen.dart';
import 'package:polaris_suite_app/view_model/wrapper_screen_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  //screens
  List<dynamic> screens = [
    HomeScreen(),
    NotificationScreen(),
    DocumentExploreScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final screenProvider =
        Provider.of<WrapperScreenViewProvider>(context, listen: true);
    return Scaffold(
      body: screens[screenProvider.currentIndex],
      //
      bottomNavigationBar: Consumer<WrapperScreenViewProvider>(
        builder: (context, newvalue, child) {
          return BottomNavigationBar(
            backgroundColor: AppColors.primaryColor,
            showSelectedLabels: true,
            elevation: 1.5,
            currentIndex: newvalue.currentIndex,
            onTap: (value) {
              newvalue.setNewIndex(value);
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  newvalue.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                ),
                backgroundColor: AppColors.primaryColor,
              ),

              //
              BottomNavigationBarItem(
                label: 'Notifications',
                icon: Icon(
                  newvalue.currentIndex == 1
                      ? Icons.notifications
                      : Icons.notifications_none,
                ),
                backgroundColor: AppColors.primaryColor,
              ),

              //
              BottomNavigationBarItem(
                label: 'Explore',
                icon: Icon(
                  newvalue.currentIndex == 2 ? Icons.book : Icons.book_outlined,
                ),
              ),

              //
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  newvalue.currentIndex == 3
                      ? Icons.people
                      : Icons.people_outline,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
