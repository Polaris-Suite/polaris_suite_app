import 'package:flutter/material.dart';
import 'package:polaris_suite_app/models/testcase_models.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/comment_viewmodel.dart';
import 'package:polaris_suite_app/view_model/screens_viewmode.dart/testcases_viewmodel.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  CommentScreen({super.key, required this.testcases});
  Testcases? testcases = Testcases();

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentViewModel>(context);
    final testProvider = Provider.of<TestCasesViewModel>(context);

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
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.testcases!.name.toString(),
                        style: AppTextStyle.textH2,
                      ),
                      vSizedBox0,
                      Row(
                        children: [
                          const Text(
                            'Description: ',
                            style: AppTextStyle.body,
                          ),
                          Text(
                            widget.testcases!.description.toString(),
                            style: AppTextStyle.body,
                          ),
                        ],
                      ),
                      vSizedBox0,
                      Row(
                        children: [
                          const Text(
                            'Created Id: ',
                            style: AppTextStyle.body,
                          ),
                          Text(
                            widget.testcases!.linkedProject!.createdAt.toString(),
                            style: AppTextStyle.body,
                          ),
                        ],
                      ),
                      vSizedBox0,
                      Row(
                        children: [
                          const Text(
                            'Status: ',
                            style: AppTextStyle.body,
                          ),
                          Text(
                            widget.testcases!.status.toString(),
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      vSizedBox0,
                      Row(
                        children: [
                          const Text(
                            'Creator Id: ',
                            style: AppTextStyle.body,
                          ),
                          Text(
                            widget.testcases!.creatorId.toString(),
                            style: AppTextStyle.body,
                          ),
                        ],
                      ),
                      vSizedBox0,
                      Row(
                        children: [
                          const Text(
                            'Type: ',
                            style: AppTextStyle.body,
                          ),
                          Text(
                            widget.testcases!.type.toString(),
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            vSizedBox1,
            const Text(
              'Comments',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            vSizedBox1,
            // Text(widget.testcaseSpecific!.environment.toString()),
            // Expanded(
            //     child: FutureBuilder(
            //   future: testProvider
            //       .getSingleTestCaseData(widget.testcase!.environment.toString()),
            //   builder: (context, snapshot) {
            //     return ListView.builder(
            //       itemCount: 2,
            //       itemBuilder: (context, index) {
            //         final data = snapshot.data!.testcases![index].comments![index];
            //         return ListTile(
            //           title: Text(data.toString()),
            //         );
            //       },
            //     );
            //   },
            // )),
            Expanded(
              child: ListView.builder(
                itemCount: widget.testcases!.comments!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 4,
                            offset: Offset(0, 1), // changes position of shadow
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.testcases!.comments![index].comment.toString(),
                              style: AppTextStyle.body,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Expanded(
            //   child: Container(
            //     child: Text(widget.testcaseSpecific!.comments!.length.toString()),
            //     // child: FutureBuilder(
            //     //   future: testProvider.getTestCasesData(),
            //     //   builder: (context, snapshot) {
            //     //     return ListView.builder(
            //     //       itemCount: snapshot.data!.testcases!.length,
            //     //       itemBuilder: (context, index) {
            //     //         return Text(
            //     //           snapshot.data!.testcases![index].comments![index].comment
            //     //               .toString(),
            //     //         );
            //     //       },
            //     //     );
            //     //   },
            //     // ),
            //   ),
            // ),
            vSizedBox1,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Place Your Comment',
                    border: InputBorder.none,
                  ),
                )),
                IconButton(
                  onPressed: () {
                    if (_controller.text.isEmpty) {
                      Utils.flushbarErrorMessage(
                          context, 'Comment can not be empty', AppColors.secondaryColor);
                    } else {
                      commentProvider
                          .postComment(
                              widget.testcases!.sId.toString(),
                              _controller.text.toString(),
                              widget.testcases!.creatorId.toString(),
                              context)
                          .then((value) {
                        _controller.clear();
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.send_rounded,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            vSizedBox2,
          ],
        ),
      ),
    );
  }
}
