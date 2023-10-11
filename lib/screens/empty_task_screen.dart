import 'package:flutter/material.dart';

class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/emptyBackground.png'),
            height: 250,
          ),
          SizedBox(height: 20),
          Text(
            'Task Masih Kosong...',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
