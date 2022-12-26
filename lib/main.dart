import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prectice/provider/fav_provider.dart';
import 'package:provider_prectice/provider/theme_changer_provider.dart';
import 'package:provider_prectice/screen/fav_screen.dart';
import 'package:provider_prectice/screen/homepage.dart';
import 'package:provider_prectice/screen/providerclass.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OneChangeProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteProvider()),
    ChangeNotifierProvider(create: (context) => ThemeChanger()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    print('build');
    return MaterialApp(
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.red),
        // appBarTheme: AppBarTheme(backgroundColor: Colors.red),
        // primaryColor: Colors.red
        primarySwatch: Colors.green,
      ),

      home: Scaffold(
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
