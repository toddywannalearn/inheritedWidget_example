import 'package:flutter/material.dart';

import '../main.dart';

class ButtonsPage extends StatefulWidget {
  ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => ButtonsPageState();
}

class ButtonsPageState extends State<ButtonsPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('BUTTONS_PAGE dependencies changed');
  }

  @override
  Widget build(BuildContext context) {
    /// I'm not using the ThemeInherited here because this widget is a child of the HomePage which is already signed
    //ThemeInherited.of(context);

    /// We can access variables and methods of parent widgets using the context.
    /// The method "findAncestorStateOfType<MyAppState>()" will allow us to use the method get themeMode inside the MyAppState class
    final state = context.findAncestorStateOfType<MyAppState>()!;

    final isDark = state.themeMode == ThemeMode.dark;

    final isLoading = state.isLoading == false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Page'),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Switch(value: isLoading, onChanged: (value){
                if(value) {
                  state.changeLoading(false);
                } else {
                  state.changeLoading(true);
                }
              }),
              Expanded(
                child: LoadingInherited(isLoading: isLoading, child: Group1()),
              ),
              Expanded(
                child: LoadingInherited(isLoading: isLoading, child: Group2()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Group1 extends StatelessWidget {
  const Group1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //LoadingInherited.of(context);

    final isLoading = LoadingInherited.of(context)?.isLoading;

    print('group 1 changed');

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white70)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: isLoading == false
                    ? const Text('button 1')
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: isLoading == false
                    ? const Text('button 2')
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}

class Group2 extends StatelessWidget {
  const Group2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final isLoading = LoadingInherited.of(context)?.isLoading;

    print('group 2 changed');

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.white70)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: isLoading == false
                    ? const Text('button 1')
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: isLoading == false
                    ? const Text('button 2')
                    : const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}

class LoadingInherited extends InheritedWidget {
  final bool isLoading;

  const LoadingInherited(
      {super.key, required super.child, required this.isLoading});

  static LoadingInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoadingInherited>();
  }

  @override
  bool updateShouldNotify(covariant LoadingInherited oldWidget) {
    return isLoading != oldWidget.isLoading;
  }
}
