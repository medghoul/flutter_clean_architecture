
import 'package:clean_architecture/core/animations/fade_animations.dart';
import 'package:clean_architecture/core/animations/image_animations.dart';
import 'package:clean_architecture/core/animations/text_animation.dart';
import 'package:clean_architecture/core/enums/text_animation_type.dart';
import 'package:clean_architecture/core/extensions/context_extension.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:clean_architecture/core/resources/res.dart';
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
      backgroundColor: AppColors.primary,
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
                  child: ImageZoomIn(child:Image.asset(
                    ImageSrc.logo,
                    height: 200,
                    width: 200,
                  ),
                ),
                ),
                const SizedBox(
                  height: AppDimensions.paddingM,
                ),
                Opacity(
                  opacity: controller.value,
                  child: TextAnimation(
                    animationType: TextAnimationType.fadeIn,
                    duration: 400,
                    text: Text(
                    context.translate(LangKeys.title),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppDimensions.paddingS,
                ),
                Opacity(
                  opacity: controller.value,
                  child: TextAnimation(
                    duration: 400,
                    animationType: TextAnimationType.wave,
                    text: Text(context.translate(LangKeys.caption),
                     textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
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
                      FadeInUp(
                        duration: 400,
                        child: CustomOutlinedButton(
                          backgroundColor: AppColors.tertiary,
                        onPressed: () {
                          context.goNamed(AppRoute.onboarding.name);
                        },
                        text: context.translate(LangKeys.start),
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
