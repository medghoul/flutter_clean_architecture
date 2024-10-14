import 'package:clean_architecture/core/resources/res.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.body,
    required this.appBarBody,
    super.key,
  });
  final Widget body;
  final Widget appBarBody;

  @override
  Widget build(BuildContext context) {
    return ColoredScaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(
              body: appBarBody,
            ),
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}

class ColoredScaffold extends StatelessWidget {
  const ColoredScaffold({
    required this.body,
    required this.backgroundColor,
    super.key,
  });
  final Widget body;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ColoredBox(
          color: Colors.white,
          child: body,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.body,
    super.key,
    this.padding = const EdgeInsets.all(AppDimensions.padding21),
  });
  final Widget body;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        //boxShadow: Shadows.appbarShadow,
      ),
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
