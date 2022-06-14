import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EmptyTransition extends StatelessWidget {
  final Widget child;
  const EmptyTransition({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, PageTransition(type: PageTransitionType.fade, child: child));
    });
    return const Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
