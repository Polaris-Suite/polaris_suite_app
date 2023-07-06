import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
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
                              style: AppTextStyle.textH3,
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
                // Text('SHORTCUT'),

                //RECENT
                const Text(
                  'RECENT',
                  style: AppTextStyle.textH6,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.5,
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
