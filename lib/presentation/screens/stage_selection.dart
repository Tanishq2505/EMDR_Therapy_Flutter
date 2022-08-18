import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emdr_therapy/presentation/screens/stage_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../widgets/empty_transition.dart';

class StageSelection extends StatefulWidget {
  const StageSelection({Key? key}) : super(key: key);

  @override
  State<StageSelection> createState() => _StageSelectionState();
}

class _StageSelectionState extends State<StageSelection> {
  // final audioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    var audioPlayer = Provider.of<AssetsAudioPlayer>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: kButtonStyle,
                  onPressed: () {
                    moveToPage(audioPlayer: audioPlayer, stage: 1);
                  },
                  child: Text(
                    "Stage 1",
                    style: kTextStyle,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: kButtonStyle,
                  onPressed: () {
                    moveToPage(audioPlayer: audioPlayer, stage: 2);
                  },
                  child: Text(
                    "Stage 2",
                    style: kTextStyle,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: kButtonStyle,
                  onPressed: () {
                    moveToPage(audioPlayer: audioPlayer, stage: 3);
                  },
                  child: Text(
                    "Stage 3",
                    style: kTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void moveToPage(
      {required AssetsAudioPlayer audioPlayer, required int stage}) {
    audioPlayer.open(
      Audio('assets/audio/bgm.mp3'),
      autoStart: true,
      volume: 0.15,
    );
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: EmptyTransition(
          child: StageScreen(
            stageNumber: stage,
          ),
        ),
      ),
    );
  }
}
