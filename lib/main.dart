import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ThemeInherited(
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
          themeMode: themeMode),
    );
  }
}

/// [InheritedWidget] It is a class that can inform its children to rebuild if it itself has been rebuild.
/// It will only rebuild the widgets that are signed by the InheritedWidget, meaning only the signed elements will be notified to check whether they should be rebuilt or not.
/// Although it has some complexity on its usage, the inheritedWidget was the original way to update specific dependencies on the tree. Nowadays it isn't so used because there are better and simpler ways
/// to update info through the tree
/// Usage: While parent widgets like stateful and stateless will only update itself using a setState for example, the InheritedWidget will affect the signed children on the widget tree.
/// Example: Let's say you have the following widget tree
/// MaterialApp > Scaffold > Column > child1: Container1 > button1 | child2: Container2 > button2
class ThemeInherited extends InheritedWidget {
  final ThemeMode themeMode;

  const ThemeInherited(
      {super.key, required super.child, required this.themeMode});

  /// Tip: You can create a static method returning the "dependOnInheritedWidgetOfExactType<>()" so you'll have a more readable code instead of calling the entire method on the widget
  static ThemeInherited? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ThemeInherited>();
  }

  /// will check if the stablished state(atribute) on the widget was changed comparing with the oldWidget state,
  /// if they're different than the didChangeDependencies will be notified and the widget will be rebuild
  @override
  bool updateShouldNotify(covariant ThemeInherited oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
