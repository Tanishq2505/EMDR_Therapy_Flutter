import 'package:emdr_therapy/presentation/screens/practice.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StageScreen extends StatefulWidget {
  final int stageNumber;
  const StageScreen({Key? key, required this.stageNumber}) : super(key: key);

  @override
  State<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends State<StageScreen> {
  var textOpacity = 0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      textOpacity = 1.0;
      if (mounted) {
        setState(() {});
      }
    });
    Future.delayed(Duration(seconds: 2), () {
      textOpacity = 0.0;
      if (mounted) {
        setState(() {});
      }
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: PracticeScreen(
            stage: widget.stageNumber,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: textOpacity,
            child: Text(
              "Stage ${widget.stageNumber}",
              style: TextStyle(
                fontSize: (screenSize.width * 0.2) / 1.6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
