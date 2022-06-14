import 'package:emdr_therapy/presentation/screens/practice.dart';
import 'package:emdr_therapy/presentation/screens/settings.dart';
import 'package:emdr_therapy/presentation/widgets/empty_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: EmptyTransition(
                            child: PracticeScreen(),
                          ),
                        ),
                      );
                    },
                    child: Text("Practice"),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
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
                    child: Text("Settings"),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () => SystemNavigator.pop(animated: true),
                  child: Text("Exit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
