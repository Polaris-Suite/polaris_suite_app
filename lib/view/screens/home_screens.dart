import 'package:flutter/material.dart';
import 'package:polaris_suite_app/models/project_dropdown.dart';
import 'package:polaris_suite_app/models/project_model.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/home_screen_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_dropdown_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/project_screen_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/shortcuts_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();
  List<String> title = ['Project', 'Test', 'Result'];

  @override
  Widget build(BuildContext context) {
    final dashboardProv = Provider.of<HomeScreenViewModel>(context);
    final shortcutsProv = Provider.of<ShortcutsViewModel>(context);
    final dropDownProvider = Provider.of<ProjectProvider>(context);
    final project = dropDownProvider.projects;
    // Define a variable to store the currently selected project
    // Dash
    // List<Projects?> projects = Dash
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                // Header
                const Row(
                  children: [
                    Text(
                      'Home',
                      style: AppTextStyle.textH1,
                    ),
                  ],
                ),
                vSizedBox3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Shortcuts',
                      style: AppTextStyle.textH3,
                    ),
                    IconButton(
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
                                      // key: _formKey,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Shortcut title'),
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
                                                borderSide: BorderSide(
                                                    color: Colors
                                                        .grey.shade300), //<-- SEE HERE
                                              ),
                                            ),
                                          ),
                                          vSizedBox2,
                                          // DropdownButton<ProjectDropDownModel>(
                                          //   hint: Text('Select a Project'),
                                          //   value: selectedProject,
                                          //   onChanged: (ProjectDropDownModel? project) {
                                          //     selectedProject = project;
                                          //     // Handle selected project
                                          //     print('Selected Project: ${project?.name}');
                                          //   },
                                          //   items: project
                                          //       .map((ProjectDropDownModel project) {
                                          //     return DropdownMenuItem<
                                          //         ProjectDropDownModel>(
                                          //       value: project,
                                          //       child: Text(project.name),
                                          //     );
                                          //   }).toList(),
                                          // ),
                                          // const Text('Projects'),
                                          vSizedBox2,
                                          CustomButton(
                                            color: Colors.green.shade200,
                                            btntxt: 'Create Shortcuts',
                                            onPressed: () {},
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
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
                vSizedBox1,
                Container(
                  child: FutureBuilder(
                    future: shortcutsProv.getShortCutsData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.shortcuts!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final data = snapshot.data!.shortcuts![index];
                              return Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(title[index].toString()),
                                      const Text(
                                        'Default Shortcut',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        data.createdAt.toString(),
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                      vSizedBox2,
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                vSizedBox2,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: FutureBuilder(
                          future: dashboardProv.getDashboardData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder: (BuildContext ctx, index) {
                                    final data =
                                        snapshot.data!.dashboard!.projects![index];
                                    return Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(title[index].toString()),
                                            vSizedBox1,
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  snapshot
                                                      .data!.dashboard!.projects!.length
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            vSizedBox2,
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Container(
                        child: FutureBuilder(
                          future: dashboardProv.getDashboardData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder: (BuildContext ctx, index) {
                                    final data = snapshot.data!.dashboard!.totalTestCases;
                                    return Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(title[1].toString()),
                                            vSizedBox1,
                                            Expanded(
                                              child: Text(
                                                data.toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                            ),
                                            vSizedBox2,
                                          ],
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
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Container(
                        child: FutureBuilder(
                          future: dashboardProv.getDashboardData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 1,
                                  itemBuilder: (BuildContext ctx, index) {
                                    final data = snapshot.data!.dashboard!.totalReports;
                                    return Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(title[2].toString()),
                                            vSizedBox1,
                                            Expanded(
                                              child: Text(
                                                data.toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 28,
                                                ),
                                              ),
                                            ),
                                            vSizedBox2,
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            return const Text('');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                vSizedBox2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
