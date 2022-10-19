import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final PreferredSizeWidget? drawer;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  const ScaffoldWrapper({
    Key? key, 
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bounded = MediaQuery.of(context).textScaleFactor.clamp(1.0, 1.2);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: bounded),
      child: Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: body,
        backgroundColor: backgroundColor,
        floatingActionButton: floatingActionButton,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
      ),
    );
  }
}
