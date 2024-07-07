import 'package:flutter/material.dart';

class SizedDivider extends StatelessWidget {
  const SizedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Divider(height: 2),
        SizedBox(height: 10),
      ],
    );
  }
}
