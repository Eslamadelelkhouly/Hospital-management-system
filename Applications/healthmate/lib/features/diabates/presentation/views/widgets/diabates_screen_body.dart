import 'package:flutter/material.dart';

class DiabatesScreenBody extends StatelessWidget {
  const DiabatesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Add your widgets here
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(child: Text('Header')),
          ),
          Container(
            height: 600,
            color: Colors.green,
            child: Center(child: Text('Content')),
          ),
        ],
      ),
    );
  }
}