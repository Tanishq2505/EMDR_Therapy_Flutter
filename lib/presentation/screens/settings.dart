import 'package:emdr_therapy/constants.dart';
import 'package:emdr_therapy/data/models/Setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var size = 50.0;
  double time = 1.0;
  var group = 0;
  Color color = Colors.green;
  AnimationType animationType = AnimationType.BLINK;
  int duration = 1;
  bool clockwise = true;
  @override
  void initState() {
    var settings = Provider.of<Setting>(context, listen: false);
    size = settings.size;
    time = settings.time.toDouble();
    animationType = settings.animationType;
    color = settings.color;
    duration = settings.duration;
    clockwise = settings.clockwise;
    if (settings.animationType == AnimationType.BLINK) {
      group = 0;
    } else if (settings.animationType == AnimationType.GLIDE) {
      group = 1;
    } else {
      group = 2;
    }
    super.initState();
  }

  void changeColor(Color _color) {
    setState(() => color = _color);
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Setting>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenSize.width * 0.3,
                      top: screenSize.height * 0.35),
                  child: Container(
                    width: (25 * (size / 11)).toDouble(),
                    height: (25 * (size / 11)).toDouble(),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(500),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SingleChildScrollView(
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.chevron_left,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Text("Size: ${size.toInt()}%"),
                          SizedBox(
                            width: screenSize.width * 0.05,
                          ),
                          Expanded(
                            child: Slider(
                                min: 1,
                                max: 100,
                                value: size,
                                onChanged: (_value) {
                                  size = _value;
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Speed: ${time.toInt()} %"),
                          SizedBox(
                            width: screenSize.width * 0.027,
                          ),
                          Expanded(
                            child: Slider(
                                min: 1,
                                max: 100,
                                value: time,
                                onChanged: (_value) {
                                  time = _value;
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Type:"),
                          SizedBox(
                            width: screenSize.width * 0.05,
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Radio(
                                value: 0,
                                groupValue: group,
                                onChanged: (int? value) {
                                  group = value!;
                                  setState(() {});
                                },
                              ),
                              title: Text("Blink"),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Radio(
                                  value: 1,
                                  groupValue: group,
                                  onChanged: (int? value) {
                                    group = value!;
                                    setState(() {});
                                  }),
                              title: Text("Glide"),
                            ),
                          ),
                          // Expanded(
                          //   child: ListTile(
                          //     leading: Radio(
                          //       value: 2,
                          //       groupValue: group,
                          //       onChanged: null
                          //       //     (int? value) {
                          //       //   group = value!;
                          //       //   setState(() {});
                          //       // }
                          //       ,
                          //     ),
                          //     title: Text("Fade",),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Color:"),
                          SizedBox(
                            width: screenSize.width * 0.065,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Pick"
                                      " a color"),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      colorPickerWidth: screenSize.width * 0.2,
                                      // paletteType: PaletteType.hueWheel,
                                      pickerColor: color,
                                      onColorChanged: changeColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(500),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Duration: ${(duration)} mins",
                          ),
                          SizedBox(
                            width: screenSize.width * 0.04,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.2,
                            child: Slider(
                                min: 1,
                                max: 5,
                                value: duration.toDouble(),
                                onChanged: (_value) {
                                  duration = _value.toInt();
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Clockwise:",
                          ),
                          SizedBox(
                            width: screenSize.width * 0.04,
                          ),
                          Checkbox(
                              value: clockwise,
                              onChanged: (value) {
                                clockwise = value!;
                                setState(() {});
                              })
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => applySettings(settings),
                              child: Text("Apply"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                size = settings.size;
                                time = settings.time;
                                if (settings.animationType ==
                                    AnimationType.BLINK) {
                                  group = 0;
                                } else if (settings.animationType ==
                                    AnimationType.GLIDE) {
                                  group = 1;
                                } else {
                                  group = 2;
                                }
                                color = settings.color;
                                duration = settings.duration.toInt();
                                setState(() {});
                              },
                              child: Text("Cancel"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void applySettings(Setting settings) {
    settings.size = size;
    settings.time = time;
    settings.color = color;
    settings.duration = duration;
    settings.clockwise = clockwise;
    if (group == 0) {
      settings.animationType = AnimationType.BLINK;
    } else if (group == 1) {
      settings.animationType = AnimationType.GLIDE;
    } else {
      settings.animationType = AnimationType.FADE;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(
          "Settings Apllied Successfully!",
        ),
        backgroundColor: Colors.green,
      ),
    );
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.pop(context);
      },
    );
  }
}
