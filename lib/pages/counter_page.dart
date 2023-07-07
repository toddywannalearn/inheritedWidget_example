import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CounterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CounterPageState();
  }

}

class CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('COUNTER_PAGE dependencies changed');
  }

  @override
  Widget build(BuildContext context) {
    /// I'm not using the ThemeInherited here because this widget is a child of the HomePage which is already signed
    //ThemeInherited.of(context);

    /// We can access variables and methods of parent widgets using the context.
    /// The method "findAncestorStateOfType<MyAppState>()" will allow us to use the method get themeMode inside the MyAppState class
    final state = context.findAncestorStateOfType<MyAppState>()!;

    final isDark = state.themeMode == ThemeMode.dark;


    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
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