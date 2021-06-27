import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Home!"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  position.toString(),
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
