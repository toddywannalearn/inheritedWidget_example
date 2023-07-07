import 'package:flutter/material.dart';
import 'package:inherited_playground/pages/counter_page.dart';

import '../main.dart';
import 'buttons_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('HOME_PAGE dependencies changed');
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
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CounterPage();
              }));
            }, child: const Text('Counter Example')),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ButtonsPage();
              }));
            }, child: const Text('Shimmer Example')),
          ],
        ),
      ),
    );
  }
}