import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/details_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Initial Selected Value
  String _selectedItem = 'Active'; // Initial selected item

  // List of items for the dropdown
  final List<String> _dropdownItems = ['Active', 'On Hold', 'Complete'];

  final TextEditingController _projectName = TextEditingController();
  final TextEditingController _projectDesc = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _projectDesc.dispose();
    _projectName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailsProv = Provider.of<DetailsViewModel>(context);
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
                const Text('Project Name'),
                TextFormField(
                  controller: _projectName,
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
                TextFormField(
                  controller: _projectDesc,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300), //<-- SEE HERE
                    ),
                  ),
                ),
                vSizedBox2,
                const Text('Project Status'),
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
                  btntxt: 'Update Project',
                  onPressed: () {
                    detailsProv
                        .updateProject(_projectName.text.toString(),
                            _projectDesc.text.toString(), context)
                        .then((value) {
                      _projectName.clear();
                      _projectDesc.clear();
                    });
                  },
                  btntxtColor: Colors.green.shade900,
                ),
                vSizedBox2,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade200,
                    ),
                    child: Text(
                      'Archieve Project',
                      style: TextStyle(
                        color: Colors.orange.shade900,
                      ),
                    ),
                  ),
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
                      'Delete Project ',
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
