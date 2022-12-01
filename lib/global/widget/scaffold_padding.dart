import 'package:flutter/material.dart';

class ScaffoldPadding extends StatelessWidget {
  final Widget child;
  const ScaffoldPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: child,
    );
  }
}
