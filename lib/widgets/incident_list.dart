import 'package:flutter/material.dart';

class IncidentList extends StatelessWidget {
  const IncidentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        title: Text("Item ${index + 1}"),
      ),
    );
  }
}
