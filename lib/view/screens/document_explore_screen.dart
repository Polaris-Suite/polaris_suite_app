import 'package:flutter/material.dart';

class DocumentExploreScreen extends StatefulWidget {
  const DocumentExploreScreen({super.key});

  @override
  State<DocumentExploreScreen> createState() => _DocumentExploreScreenState();
}

class _DocumentExploreScreenState extends State<DocumentExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Document Explore Screen'),
      ),
    );
  }
}
