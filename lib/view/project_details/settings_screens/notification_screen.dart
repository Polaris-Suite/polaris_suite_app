import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class SettingsNotificaitonScreen extends StatefulWidget {
  const SettingsNotificaitonScreen({super.key});

  @override
  State<SettingsNotificaitonScreen> createState() => _SettingsNotificaitonScreenState();
}

class _SettingsNotificaitonScreenState extends State<SettingsNotificaitonScreen> {
  // Initial Selected Value
  String _selectedItem = 'Email'; // Initial selected item

  // List of items for the dropdown
  final List<String> _dropdownItems = ['Email', 'Push Notification', 'No Notification'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox2,
          Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notifications',
                  style: AppTextStyle.textH6,
                ),
                vSizedBox1,
                const Text(
                  'Get notified from polaris suite',
                ),
                vSizedBox2,
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade300), // Customize the border color
                    borderRadius:
                        BorderRadius.circular(5.0), // Customize the border radius
                  ),
                  child: DropdownButton<String>(
                    underline: null,
                    isExpanded: true,
                    value: _selectedItem.isNotEmpty ? _selectedItem : null,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Text(item),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                vSizedBox3,
                CustomButton(
                  color: Colors.green.shade200,
                  btntxt: 'Send Invitation',
                  onPressed: () {},
                  btntxtColor: Colors.green.shade900,
                ),
                vSizedBox2,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade200,
                    ),
                    child: Text(
                      'Cancel Inviation ',
                      style: TextStyle(
                        color: Colors.red.shade800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
