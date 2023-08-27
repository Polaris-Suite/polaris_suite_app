import 'package:flutter/material.dart';

class TestCaseScreens extends StatefulWidget {
  const TestCaseScreens({super.key});

  @override
  State<TestCaseScreens> createState() => _TestCaseScreensState();
}

class _TestCaseScreensState extends State<TestCaseScreens> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TestCase Screen'),
    );
  }
}
