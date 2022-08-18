import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emdr_therapy/constants.dart';
import 'package:emdr_therapy/presentation/screens/settings.dart';
import 'package:emdr_therapy/presentation/screens/stage_selection.dart';
import 'package:emdr_therapy/presentation/widgets/empty_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final audioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    var audioPlayer = Provider.of<AssetsAudioPlayer>(context);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Image(
                  image: AssetImage("assets/images/home-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        "EMDR Therapy",
                        style: headingTextStyle.copyWith(
                          fontSize: screenSize.height * 0.09,
                        ),
                      ),
                      Text(
                        "Eye movement desensitization and reprocessing (EMDR) "
                        "refers to an interactive psychotherapy technique used "
                        "to relieve psychological stress. According to the "
                        "theory behind the approach, traumatic and painful "
                        "memories can cause post-traumatic stress when you "
                        "don't process them completely.",
                        style: headingTextStyle.copyWith(
                          fontSize: screenSize.height * 0.04,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.05,
                      ),
                      ElevatedButton(
                        style: kButtonStyle,
                        onPressed: () async {
                          // var randInt = Random().nextInt(2) + 1;
                          // audioPlayer.open(
                          //   Audio('assets/audio/bgm.mpeg'),
                          //   volume: 0.15,
                          // );
                          // if (randInt == 1) {
                          //   await audioPlayer.seek(
                          //     Duration(milliseconds: 1500),
                          //     force: true,
                          //   );
                          // }
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     type: PageTransitionType.fade,
                          //     child: EmptyTransition(
                          //       child: StageScreen(
                          //         stageNumber: 1,
                          //       ),
                          //     ),
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            PageTransition(
                              child: EmptyTransition(
                                child: StageSelection(),
                              ),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              "assets/json/play.json",
                              width: screenSize.width * 0.08,
                            ),
                            Text(
                              "Play             ",
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: kButtonStyle,
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: EmptyTransition(
                                child: SettingsPage(),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              "assets/json/settings.json",
                              width: screenSize.width * 0.08,
                            ),
                            Text(
                              "Settings     ",
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: kButtonStyle,
                          onPressed: () => SystemNavigator.pop(animated: true),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Lottie.asset(
                                "assets/json/exit.json",
                                width: screenSize.width * 0.08,
                              ),
                              Text(
                                "Exit     ",
                                style: kTextStyle,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
