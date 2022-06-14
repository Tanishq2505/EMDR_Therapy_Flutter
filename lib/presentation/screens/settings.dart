import 'package:emdr_therapy/constants.dart';
import 'package:emdr_therapy/data/models/Setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var size = 1.0;
  var time = 1.0;
  var group = 0;
  AnimationType animationType = AnimationType.BLINK;
  @override
  void initState() {
    var settings = Provider.of<Setting>(context, listen: false);
    size = settings.size;
    time = settings.time.toDouble();
    animationType = settings.animationType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Setting>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Size: ${size.toInt()}"),
                  SizedBox(
                    width: screenSize.width * 0.05,
                  ),
                  Expanded(
                    child: Slider(
                        min: 1,
                        max: 50,
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
                  Text("Time: ${time.toInt()} %"),
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
                  Expanded(
                    child: ListTile(
                      leading: Radio(
                        value: 2,
                        groupValue: group,
                        onChanged: (int? value) {
                          group = value!;
                          setState(() {});
                        },
                      ),
                      title: Text("Fade"),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Apply"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Cancel"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
