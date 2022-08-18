import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emdr_therapy/constants.dart';
import 'package:emdr_therapy/data/models/Setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PracticeScreen extends StatefulWidget {
  final int stage;
  const PracticeScreen({Key? key, required this.stage}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  AlignmentGeometry alignment = Alignment.center;
  bool hasStarted = false;
  @override
  void initState() {
    super.initState();
    var audioPlayer = Provider.of<AssetsAudioPlayer>(context, listen: false);
    var setting = Provider.of<Setting>(context, listen: false);
    start(setting, audioPlayer);
  }

  @override
  Widget build(BuildContext context) {
    var audioPlayer = Provider.of<AssetsAudioPlayer>(context, listen: false);
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
                  child: IconButton(
                    onPressed: () async {
                      await audioPlayer.stop();
                      super.dispose();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                    ),
                  ),
                ),
                Spacer(),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: IconButton(
                //     onPressed: () async {
                //       hasStarted = !hasStarted;
                //       if (mounted) {
                //         setState(() {});
                //       }
                //
                //       hasStarted = !hasStarted;
                //       alignment = Alignment.center;
                //       if (mounted) {
                //         setState(() {});
                //       }
                //     },
                //     icon: Icon(
                //       (hasStarted)
                //           ? Icons.pause_circle_outline
                //           : Icons.play_circle_outline,
                //       size: 30,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: AnimatedContainer(
              duration: Duration(
                  milliseconds: setting.animationType != AnimationType.BLINK
                      ? (500 / (setting.time / 10)).ceil()
                      : 0),
              curve: Curves.easeInOut,
              alignment: alignment,
              child: Container(
                width: (25 * (setting.size / 11)).toDouble(),
                height: (25 * (setting.size / 11)).toDouble(),
                decoration: BoxDecoration(
                  color: setting.color,
                  borderRadius: BorderRadius.circular(500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void start(Setting setting, AssetsAudioPlayer audioPlayer) async {
    for (int i = 0; i < ((setting.duration * 60)); i++) {
      await Future.delayed(
          Duration(milliseconds: (500 / (setting.time / 10)).ceil()));
      startPractice(widget.stage, setting.clockwise);
      if (mounted) {
        setState(() {});
      }
    }
    await Future.delayed(
      Duration(milliseconds: 500),
    );

    if (mounted) {
      Navigator.pop(context);
      await audioPlayer.stop();
    }
  }

  void startPractice(int stage, bool clockwise) {
    if (stage == 1) {
      if (alignment == Alignment.center || alignment == Alignment.topCenter) {
        alignment = Alignment.bottomCenter;
      } else {
        alignment = Alignment.topCenter;
      }
    } else if (stage == 2) {
      if (alignment == Alignment.center || alignment == Alignment.centerLeft) {
        alignment = Alignment.centerRight;
      } else {
        alignment = Alignment.centerLeft;
      }
    } else if (stage == 3) {
      if (clockwise) {
        if (alignment == Alignment.center ||
            alignment == Alignment.bottomCenter) {
          alignment = Alignment.centerLeft;
        } else if (alignment == Alignment.centerLeft) {
          alignment = Alignment.topCenter;
        } else if (alignment == Alignment.topCenter) {
          alignment = Alignment.centerRight;
        } else {
          alignment = Alignment.bottomCenter;
        }
      } else {
        if (alignment == Alignment.center ||
            alignment == Alignment.bottomCenter) {
          alignment = Alignment.centerRight;
        } else if (alignment == Alignment.centerLeft) {
          alignment = Alignment.bottomCenter;
        } else if (alignment == Alignment.topCenter) {
          alignment = Alignment.centerLeft;
        } else {
          alignment = Alignment.topCenter;
        }
      }
    }
  }
}
