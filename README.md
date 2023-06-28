# inherited_playground

A Flutter playground app to practice the concepts behind the abstract class inheritedWidget.

## Description

It is a class that can inform its children to rebuild if it itself has been rebuilt.
It will only rebuild the widgets that are signed by the InheritedWidget, meaning only the signed elements will be notified to check whether they should be rebuilt or not.

It is important to know that the changes made on parent widgets like Stateful and Statelless will only affect itself. It's necessary to use the inherited widget to make the children elements
update.




- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
