import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/routing/app_routes.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: Dimension.paddingM),
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
                  height: Dimension.padding,
                ),
                Opacity(
                  opacity: controller.value,
                  child: Text(
                    translation.accessPage.letsStart,
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
                      ElevatedButton(
                       style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const WidgetStatePropertyAll(
                                AppColors.tertiary,
                              ),
                            ),
                        onPressed: () {
                          GoRouter.of(context).pushNamed(AppRoute.signIn.name);
                        },
                        child: Text(translation.accessPage.access),
                      ),
                      const SizedBox(
                        height: Dimension.padding,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          GoRouter.of(context).pushNamed(AppRoute.signUp.name);
                        },
                        child: Text(translation.accessPage.signup),
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
