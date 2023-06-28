import 'package:flutter/material.dart';

import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('dependencies changed');
  }

  @override
  Widget build(BuildContext context) {

    /// Since this widget is signed with the following method, it will be rebuild when the inheritedWidget be destroyed
    /// We could also have signed the widget like this "context.dependOnInheritedWidgetOfExactType<ThemeInherited>();", but as mentioned
    /// on the ThemeInherited Class, calling a static method is more readable and sugested by the flutter team
    ThemeInherited.of(context);

    /// We can access variables and methods of parent widgets using the context.
    /// The method "findAncestorStateOfType<MyAppState>()" will allow us to use the method get themeMode inside the MyAppState class
    final state = context.findAncestorStateOfType<MyAppState>()!;

    final isDark = state.themeMode == ThemeMode.dark;


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          /// On the following logic to change the app's theme we don't need to use the setState
          Switch(
              value: isDark,
              onChanged: (value) {
                if (value) {
                  state.changeTheme(ThemeMode.dark);
                } else {
                  state.changeTheme(ThemeMode.light);
                }
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (_incrementCounter),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}