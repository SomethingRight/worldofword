import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldofword/core/settings/theme.dart';
import 'package:worldofword/module/menu/pages/settings/settings_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).primaryIconTheme,
        actionsIconTheme: Theme.of(context).primaryIconTheme,
        actions: [
          PopupMenuButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            padding: const EdgeInsets.only(right: 12),
            icon: const Icon(Icons.language, size: 25),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    Provider.of<SettingsBloc>(context, listen: false)
                        .add(const LocaleChanged(locale: Locale('en')));
                  },
                  child: Image.asset(
                    'assets/images/png/usa_icon.png',
                    width: 70,
                    height: 35,
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    Provider.of<SettingsBloc>(context, listen: false)
                        .add(const LocaleChanged(locale: Locale('ru')));
                  },
                  child: Image.asset(
                    'assets/images/png/rus_icon.png',
                    width: 70,
                    height: 35,
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(AppLocalizations.of(context)!.chooseAnAppTheme,
                    style: const TextStyle(fontSize: 26)),
                const SizedBox(
                  height: 20,
                ),
                SwitchListTile(
                    title: Text(AppLocalizations.of(context)!.light,
                        style: Theme.of(context).textTheme.bodyText2),
                    value: Variables.toggledlight,
                    activeColor: Theme.of(context).primaryColorDark,
                    secondary: const Icon(Icons.light_mode),
                    selected: Variables.toggledlight,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<SettingsBloc>(context, listen: false)
                            .add(const ThemeChanged(theme: AppTheme.light));

                        Variables.toggledlight = !Variables.toggledlight;
                        Variables.toggledDark = !Variables.toggledDark;
                      });
                    }),
                SwitchListTile(
                    title: Text(AppLocalizations.of(context)!.dark,
                        style: Theme.of(context).textTheme.bodyText2),
                    value: Variables.toggledDark,
                    activeColor: Theme.of(context).primaryColorDark,
                    secondary: const Icon(Icons.dark_mode),
                    selected: Variables.toggledDark,
                    onChanged: (value) {
                      Provider.of<SettingsBloc>(context, listen: false)
                          .add(const ThemeChanged(theme: AppTheme.dark));

                      setState(() {
                        Variables.toggledDark = !Variables.toggledDark;
                        Variables.toggledlight = !Variables.toggledlight;
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
                      value: Variables.fontSize,
                      min: 10.0,
                      max: 40.00,
                      divisions: 15,
                      label: '${Variables.fontSize.round()}',
                      onChanged: (double value) {
                        Provider.of<SettingsBloc>(context, listen: false)
                            .add(FontSizeChanged(fontSize: value));

                        setState(() {
                          Variables.fontSize = value.roundToDouble();
                        });
                      }),
                  Text(AppLocalizations.of(context)!.chooseFontSize,
                      style: TextStyle(
                        fontSize: Variables.fontSize,
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
