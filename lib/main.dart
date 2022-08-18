import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:emdr_therapy/data/models/Setting.dart';
import 'package:emdr_therapy/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(
    MultiProvider(
      providers: [
        Provider<Setting>(
          create: (_) => Setting(),
        ),
        Provider<AssetsAudioPlayer>(
          create: (_) => AssetsAudioPlayer(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
