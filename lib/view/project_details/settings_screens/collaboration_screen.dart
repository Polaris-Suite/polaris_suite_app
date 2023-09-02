import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class CollaborationScreen extends StatefulWidget {
  const CollaborationScreen({super.key});

  @override
  State<CollaborationScreen> createState() => _CollaborationScreenState();
}

class _CollaborationScreenState extends State<CollaborationScreen> {
  // Initial Selected Value
  String _selectedItem = 'Tester'; // Initial selected item

  // List of items for the dropdown
  final List<String> _dropdownItems = ['Tester', 'Developer', 'Stakeholder'];
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
                  'Collaboration',
                  style: AppTextStyle.textH6,
                ),
                vSizedBox1,
                const Text(
                  'Invite people to collaborate in the project',
                ),
                vSizedBox2,
                const Text(
                  'Email',
                ),
                TextFormField(
                  // controller: _projectName,
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Can't be empty";
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300), //<-- SEE HERE
                    ),
                  ),
                ),
                vSizedBox2,
                const Text('Project Description'),
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
