import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/view/project_details/coments/comment_screen.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/testcases_viewmodel.dart';
import 'package:provider/provider.dart';

class TestCaseScreens extends StatefulWidget {
  const TestCaseScreens({super.key});

  @override
  State<TestCaseScreens> createState() => _TestCaseScreensState();
}

class _TestCaseScreensState extends State<TestCaseScreens> {
  List<String> titles = [
    'Comments',
    'Type',
  ];
  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestCasesViewModel>(context);
    return Column(
      children: [
        vSizedBox2,
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              setState(() {});
              return testProvider.getTestCaseData();
            },
            child: Container(
              child: FutureBuilder(
                future: testProvider.getTestCaseData(),
                builder: (context, snapshot) {
                  // final data = print(snapshot.data.toString());
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
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentScreen(
                                          testcases: snapshot.data!.testcases![index],
                                        ),
                                      ));
                                },
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
                                              data.comments!.length.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              titles[0].toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //
                                        Column(
                                          children: [
                                            Text(
                                              data.type.toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              titles[1].toString(),
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
                                    Row(
                                      children: [
                                        const Text(
                                          'Status: ',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          data.status.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  data.status.toString() == 'in progress'
                                                      ? Colors.green.shade300
                                                      : Colors.amber),
                                        ),
                                      ],
                                    ),

                                    // Text(
                                    //     'Created At: ${DateTime.parse(data.comments.toString())}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: Text('No Test Cases Available..'),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
