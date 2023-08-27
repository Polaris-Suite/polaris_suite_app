import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key});

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  final TextEditingController _environmentName = TextEditingController();
  final TextEditingController _environmentDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vSizedBox3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Add Environment',
              style: AppTextStyle.textH6,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade200,
                  elevation: 0,
                ),
                child: const Icon(
                  Icons.add_box_outlined,
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // <-- SEE HERE
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Name'),
                                    TextFormField(
                                      controller: _environmentName,
                                      validator: (value) {
                                        if (value!.isEmpty || value == null) {
                                          return "Can't be empty";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300), //<-- SEE HERE
                                        ),
                                      ),
                                    ),
                                    vSizedBox2,
                                    const Text('Descripition'),
                                    TextFormField(
                                      controller: _environmentDesc,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade300), //<-- SEE HERE
                                        ),
                                      ),
                                    ),
                                    vSizedBox2,
                                    CustomButton(
                                      color: Colors.green.shade200,
                                      btntxt: 'Create Project',
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {}
                                      },
                                      btntxtColor: Colors.green.shade900,
                                    ),
                                    vSizedBox2,
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red.shade200,
                                        ),
                                        child: Text(
                                          'Cancel',
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
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        vSizedBox2,
      ],
    );
  }
}
