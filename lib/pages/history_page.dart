import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 0, // Update with actual data length
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text('Session #$index'),
            subtitle: Text('Date...'),
          );
        },
      ),
    );
  }
}
