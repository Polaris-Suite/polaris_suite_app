import 'package:flutter/material.dart';
import 'package:polaris_suite_app/models/project_model.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/environment_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/home_screen_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class UpdatedEnvironmentScreen extends StatefulWidget {
  UpdatedEnvironmentScreen({
    super.key,
    required this.appTitle,
    required this.environments,
  });
  final String? appTitle;
  List<Environments> environments = [];
  // Environments environments = Environments();

  @override
  State<UpdatedEnvironmentScreen> createState() => _UpdatedEnvironmentScreenState();
}

class _UpdatedEnvironmentScreenState extends State<UpdatedEnvironmentScreen> {
  final TextEditingController _environmentName = TextEditingController();
  final TextEditingController _environmentDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providerEnv = Provider.of<EnvironmentViewModel>(context);
    // final getEnvProv = Provider.of<ProjectScreenViewModel>(context);
    // final dashboardProv = Provider.of<HomeScreenViewModel>(context);
    return Scaffold(
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
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Create',
                  style: AppTextStyle.textH3,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                  ),
                  child: Icon(Icons.replay),
                )
              ],
            ),
            vSizedBox2,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade200,
                  elevation: 0,
                ),
                child: const Text(
                  'Create Environment',
                  style: TextStyle(
                    fontSize: 20,
                  ),
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
                                      btntxt: 'Create Environment',
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          providerEnv
                                              .createEnvironment(
                                                  _environmentName.text.toString(),
                                                  _environmentDesc.text.toString(),
                                                  context)
                                              .then((value) {
                                            _environmentDesc.clear();
                                            _environmentName.clear();
                                          });

                                          // Navigator.pop(context);
                                        }
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
            vSizedBox2,
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: widget.environments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 4,
                              blurRadius: 4,
                              offset: Offset(0, 1),
                            ),
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            widget.environments[index].name.toString(),
                            style: AppTextStyle.body,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
