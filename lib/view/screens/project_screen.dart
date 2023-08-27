import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:polaris_suite_app/view/project_details/project_details_tabbar.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final TextEditingController _projectName = TextEditingController();
  final TextEditingController _projectDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectScreenViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                      'Projects',
                      style: AppTextStyle.textH1,
                    ),
                  ],
                ),
                vSizedBox3,
                const Text(
                  'Create',
                  style: AppTextStyle.textH3,
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Project',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.add_box_outlined,
                        ),
                      ],
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
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .grey.shade300), //<-- SEE HERE
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
                                              borderSide: BorderSide(
                                                  color: Colors
                                                      .grey.shade300), //<-- SEE HERE
                                            ),
                                          ),
                                        ),
                                        vSizedBox2,
                                        CustomButton(
                                          color: Colors.green.shade200,
                                          btntxt: 'Create Project',
                                          isloading: projectProvider.isloading,
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              projectProvider
                                                  .createProject(
                                                      _projectName.text.toString(),
                                                      _projectDesc.text.toString(),
                                                      context)
                                                  .then((value) {
                                                _projectName.clear();
                                                _projectDesc.clear();
                                                // Navigator.of(context).pop();
                                              }).onError((error, stackTrace) {
                                                Utils.flushbarErrorMessage(context,
                                                    error.toString(), AppColors.danger);
                                              });
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
                vSizedBox3,
                Container(
                  child: FutureBuilder(
                    future: projectProvider.getProjectList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                            ),
                            itemCount: snapshot.data!.projects!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final data = snapshot.data!.projects![index];
                              return GestureDetector(
                                onTap: () {
                                  // print('object');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProjectDetailsTabBarScreen(
                                          appTitle: data.name.toString(),
                                        ),
                                      ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name.toString(),
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        vSizedBox2,
                                        Text(
                                          "Created at:\n${data.updatedAt.toString().trim()}",
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
