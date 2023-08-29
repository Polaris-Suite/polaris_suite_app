import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/testcases_viewmodel.dart';
import 'package:provider/provider.dart';

class TestCaseScreens extends StatefulWidget {
  const TestCaseScreens({super.key});

  @override
  State<TestCaseScreens> createState() => _TestCaseScreensState();
}

class _TestCaseScreensState extends State<TestCaseScreens> {
  List<String> titles = ['Comments', 'TestRuns', 'TestSchema'];
  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestCasesViewModel>(context);
    return Column(
      children: [
        vSizedBox2,
        Container(
          child: FutureBuilder(
            future: testProvider.getTestCasesData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.testcases!.length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.testcases![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              vSizedBox2,
                              //||comments || testruns || testschema
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        titles[0],
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        data.testRuns!.length.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //
                                  Column(
                                    children: [
                                      Text(
                                        titles[1],
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        data.testRuns!.length.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //
                                ],
                              ),
                              vSizedBox2,
                              Text('Created At: ' +
                                  DateTime.parse(data.createdAt.toString()).toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
