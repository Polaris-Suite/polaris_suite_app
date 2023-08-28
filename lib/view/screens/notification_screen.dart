import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/notification_viewmodel.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final notiProvider = Provider.of<NotificationViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: AppTextStyle.textH1,
                    ),
                  ],
                ),
                vSizedBox3,
                const Text(
                  'Recent Activities',
                  style: AppTextStyle.textH3,
                ),
                //
                ElevatedButton(
                  onPressed: () {
                    notiProvider.getActivities();
                  },
                  child: Text('data'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
