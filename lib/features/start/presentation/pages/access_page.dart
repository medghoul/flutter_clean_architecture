import 'package:clean_architecture/core/animations/fade_animations.dart';
import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


bool firstAnimation = false;

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController secondController;
  late Animation<double> animation;
  late Animation<double> secondAnimation;

  double valueAnimation = 0;

  @override
  void initState() {
    if (!firstAnimation) {
      firstAnimation = true;
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
      );
      secondController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoute.logger.name),
        child: const Icon(Icons.logo_dev),
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Opacity(
                  opacity: controller.value,
                  child: Image.asset(
                    ImageSrc.access,
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: AppDimensions.paddingM,
                ),
                Opacity(
                  opacity: controller.value,
                  child: Text(
                    context.translate(LangKeys.letsStart),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Opacity(
                  opacity: secondController.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FadeInLeft(
                        duration: 500,
                        child: CustomOutlinedButton(
                          backgroundColor: AppColors.tertiary,
                          onPressed: () {
                          GoRouter.of(context).pushNamed(AppRoute.signIn.name);
                        },
                          text: context.translate(LangKeys.signup),
                        ),
                      ),
                      const SizedBox(
                        height: AppDimensions.paddingM,
                      ),
                      FadeInRight(
                        duration: 500,
                        child: CustomOutlinedButton(
                          onPressed: () {
                            GoRouter.of(context).pushNamed(AppRoute.signUp.name);
                        },
                        textColor: AppColors.black,
                        text: context.translate(LangKeys.access),
                      ),
                      ),
                      const SizedBox(
                        height: AppDimensions.paddingXXL,
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
