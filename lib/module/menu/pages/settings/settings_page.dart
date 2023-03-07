import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
  final bool toggledColor = true;
}

class _SettingsPageState extends State<SettingsPage> {
  bool toggledlight = true;
  bool toggledDark = false;
  double fontSize = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Choose an app theme',
                    style: TextStyle(fontSize: 26)),
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                    title: const Text('light', style: TextStyle(fontSize: 20)),
                    value: toggledlight,
                    activeColor: Theme.of(context).primaryColorDark,
                    secondary: const Icon(Icons.light_mode),
                    selected: toggledlight,
                    onChanged: (value) {
                      setState(() {
                        toggledlight = !toggledlight;
                        toggledDark = !toggledDark;
                      });
                    }),
                SwitchListTile(
                    title: const Text('dark', style: TextStyle(fontSize: 20)),
                    value: toggledDark,
                    activeColor: Theme.of(context).primaryColorDark,
                    secondary: const Icon(Icons.dark_mode),
                    selected: toggledDark,
                    onChanged: (value) {
                      setState(() {
                        toggledDark = !toggledDark;
                        toggledlight = !toggledlight;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                const Divider(height: 5, thickness: 2.0),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Slider(
                      value: fontSize,
                      min: 10.0,
                      max: 40.00,
                      divisions: 15,
                      label: '${fontSize.round()}',
                      onChanged: (double value) {
                        setState(() {
                          fontSize = value.roundToDouble();
                        });
                      }),
                  Text('Choose font size',
                      style: TextStyle(
                        fontSize: fontSize,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
