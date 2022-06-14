import 'package:emdr_therapy/data/models/Setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  AlignmentGeometry alignment = Alignment.center;
  bool hasStarted = false;
  @override
  Widget build(BuildContext context) {
    var setting = Provider.of<Setting>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.chevron_left,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () async {
                      hasStarted = !hasStarted;
                      for (int i = 0; i < setting.duration; i++) {
                        print('hii');
                        print(hasStarted);
                        if (hasStarted) {
                          await Future.delayed(Duration(milliseconds: 500));
                          startPractice(setting);
                          setState(() {});
                        } else {
                          hasStarted = !hasStarted;
                          alignment = Alignment.center;
                          break;
                        }
                      }
                      hasStarted = !hasStarted;
                      alignment = Alignment.center;
                      setState(() {});
                    },
                    icon: Icon(
                      (hasStarted)
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
              alignment: alignment,
              child: Container(
                width: (25 * setting.size).toDouble(),
                height: (25 * setting.size).toDouble(),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void startPractice(Setting setting) {
    if (alignment == Alignment.center || alignment == Alignment.bottomCenter) {
      alignment = Alignment.centerLeft;
    } else if (alignment == Alignment.centerLeft) {
      alignment = Alignment.topCenter;
    } else if (alignment == Alignment.topCenter) {
      alignment = Alignment.centerRight;
    } else {
      alignment = Alignment.bottomCenter;
    }
  }
}
