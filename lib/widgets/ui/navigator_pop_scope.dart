import 'package:flutter/material.dart';

class NavigatorPopScope extends StatelessWidget {

  const NavigatorPopScope({
    required this.navigatorStateKey,
    required this.onPopPage,
    super.key,
    this.pages = const <Page<dynamic>>[],
  });

  final GlobalKey<NavigatorState> navigatorStateKey;
  final List<Page<dynamic>> pages;
  final PopPageCallback onPopPage;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        navigatorStateKey.currentState?.maybePop().then((result) {
          if (result) return Navigator.of(context).pop();
        });
      },
      child: Navigator(
        key: navigatorStateKey,
        pages: pages,
        onPopPage: onPopPage,
      ),
    );
  }
}
