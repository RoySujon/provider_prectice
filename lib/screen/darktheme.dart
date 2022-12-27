import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice/provider/theme_changer_provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({super.key});

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChanger>(
      builder: (context, themeProvider, child) => Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('ROY'),
        ),
        body: Column(
          children: [
            RadioListTile<ThemeMode>(
                title: Text('Light Mode'),
                value: ThemeMode.light,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme),
            RadioListTile<ThemeMode>(
                title: Text('Dark Mode'),
                value: ThemeMode.dark,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme),
            RadioListTile<ThemeMode>(
                title: Text('System Mode'),
                value: ThemeMode.system,
                groupValue: themeProvider.themeMode,
                onChanged: themeProvider.setTheme),
            Text('GOUTOM ROY'),
            Icon(Icons.favorite)
          ],
        ),
      ),
    );
  }
}
