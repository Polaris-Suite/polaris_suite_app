import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
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
            scrollDirection: Axis.vertical,
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
                vSizedBox2,
                Container(
                  child: FutureBuilder(
                    future: notiProvider.getActivities(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.activities!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data!.activities![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 0,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor:
                                      data.status.toString() == 'project-create'
                                          ? Colors.green.shade300
                                          : Colors.orange.shade300,
                                  child: data.status.toString() == 'project-create'
                                      ? const Icon(
                                          Icons.create_new_folder_rounded,
                                          color: Colors.white,
                                        )
                                      : const Icon(Icons.group),
                                ),
                                title: Text(
                                  data.name.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(data.description.toString()),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
                //
                // ElevatedButton(
                //   onPressed: () {
                //     notiProvider.getActivities();
                //   },
                //   child: Text('data'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
