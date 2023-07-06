import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  bool isTapped = false;
  //
  TextEditingController _searchTextController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Header
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: isTapped == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Home',
                              style: AppTextStyle.textH2,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isTapped = !isTapped;
                                    });
                                  },
                                  icon: const Icon(Icons.search),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print('CREATE =====================>>>>');
                                  },
                                  icon: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ],
                        )
                      : TextFormField(
                          controller: _searchTextController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Search',
                              prefixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isTapped = false;
                                  });
                                },
                                icon: const Icon(Icons.arrow_back_ios),
                              )),
                        ),
                ),

                //SHORTCUT
                ListTileTheme(
                  // data: Theme.of(context).copyWith(
                  //   unselectedWidgetColor: AppColors.secondaryColor,
                  //   // here for close state
                  //   colorScheme: ColorScheme.light(
                  //     primary: AppColors.primaryColor,
                  //   ), // here for open state in replacement of deprecated accentColor
                  //   dividerColor: Colors.transparent,
                  //   // if you want to remove the border
                  // ),
                  contentPadding: EdgeInsets.all(0),
                  child: ExpansionTile(
                    title: Text(
                      'Shortcut',
                      style: AppTextStyle.textH3,
                    ),
                    trailing: Icon(Icons.more_horiz),
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.abc,
                          color: Colors.red,
                        ),
                        title: Text('HHHHHHHH'),
                        subtitle: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                      ),

                      //
                      ListTile(
                        leading: Icon(
                          Icons.abc,
                          color: Colors.green,
                        ),
                        title: Text('HHHHHHHH'),
                        subtitle: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                      ),

                      //
                      ListTile(
                        leading: Icon(
                          Icons.abc,
                          color: Colors.amber,
                        ),
                        title: Text('HHHHHHHH'),
                        subtitle: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                      ),
                    ],
                  ),
                ),

                vSizedBox2,
                //RECENT
                const Text(
                  'RECENT',
                  style: AppTextStyle.textH3,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.3,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.link),
                      title: Text('MAJOR PPROJECT -BE2018SE/ POLARIS .....'),
                      subtitle: Text('You were requested'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
