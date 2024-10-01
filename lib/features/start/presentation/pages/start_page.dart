
import 'package:clean_architecture/extensions/context_extension.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

bool firstAnimation = false;

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController secondController;
  late Animation<double> animation;
  late Animation<double> secondAnimation;

  double valueAnimation = 0;

  @override
  void initState() {
    if (!firstAnimation) {
      firstAnimation = true;
      controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
      secondController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
      animation = Tween<double>(begin: 0, end: 360).animate(controller)
        ..addListener(() {
          setState(() {});
          if (animation.value.toInt() > 180 && secondController.value == 0) {
            secondController.forward();
          }
        });
      secondAnimation = Tween<double>(begin: 0, end: 1).animate(secondController)
        ..addListener(() {
          setState(() {});
        });
      controller.forward();
    } else {
      controller = AnimationController(vsync: this, value: 1);
      secondController = AnimationController(vsync: this, value: 1);
      animation = Tween<double>(begin: 360, end: 360).animate(controller)..addListener(() {});
      secondAnimation = Tween<double>(begin: 360, end: 360).animate(secondController)..addListener(() {});
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Opacity(
                  opacity: controller.value,
                  child: Image.asset(
                    ImageSrc.logo,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: Dimension.padding,
                ),
                Opacity(
                  opacity: controller.value,
                  child: Text(
                    context.translate('startPage.title'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimension.paddingS,
                ),
                Opacity(
                  opacity: controller.value,
                  child: Text(
                    context.translate('startPage.caption'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Opacity(
                  opacity: secondController.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomOutlinedButton(
                        onPressed: () {
                          context.goNamed(AppRoute.onboarding.name);
                        },
                        text: context.translate('startPage.start'),
                      ),
                      const SizedBox(
                        height: Dimension.paddingXXL,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
