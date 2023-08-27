import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
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
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.3,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.link),
                      title: Text('MAJOR PPROJECT -BE2018SE/ POLARIS .....'),
                      subtitle: Text('You were requested'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
