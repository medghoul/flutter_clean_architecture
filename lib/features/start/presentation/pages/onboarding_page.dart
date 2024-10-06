import 'package:clean_architecture/extensions/context_extension.dart';
import 'package:clean_architecture/core/resources/res.dart';
import 'package:clean_architecture/i18n/lang_keys.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:clean_architecture/widgets/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;

  late final List<TutorialModel> tutorialModels = [
    TutorialModel(
      image: ImageSrc.tutorial1,
      titleKey: 'tutorial.tutorialFirstMessageTitle',
      descriptionKey: 'tutorial.tutorialFirstMessageDescription',
    ),
    TutorialModel(
      image: ImageSrc.tutorial2,
      titleKey: 'tutorial.tutorialSecondMessageTitle',
      descriptionKey: 'tutorial.tutorialSecondMessageDescription',
    ),
    TutorialModel(
      image: ImageSrc.tutorial3,
      titleKey: 'tutorial.tutorialThirdMessageTitle',
      descriptionKey: 'tutorial.tutorialThirdMessageDescription',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimension.padding24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              tutorialModels[index].image,
              height: 300,
            ),
            Text(
              context.translate(tutorialModels[index].titleKey),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: Dimension.paddingS),
            Text(
              context.translate(tutorialModels[index].descriptionKey),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            _buildPageIndicator(),
            const SizedBox(height: Dimension.paddingM),
            CustomOutlinedButton(
              backgroundColor: AppColors.tertiary,
              onPressed: _handleContinue,
              text: context.translate(LangKeys.continueTxt),
            ),
            TextButton(
              onPressed: _navigateToAccess,
              child: Text(context.translate(LangKeys.skip)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Center(
      child: SizedBox(
        height: 19,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tutorialModels.length,
          separatorBuilder: (context, _) => const SizedBox(width: Dimension.padding),
          itemBuilder: (context, i) => _buildIndicatorDot(i),
        ),
      ),
    );
  }

  Widget _buildIndicatorDot(int i) {
    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: Container(
        height: 19,
        width: 19,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: index == i ? 19 : 17,
          width: index == i ? 19 : 17,
          decoration: BoxDecoration(
            color: index == i
                ? AppColors.primaryColor650
                : AppColors.primaryColor650.withOpacity(0.4),
            borderRadius: BorderRadius.circular(19),
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    if (index == tutorialModels.length - 1) {
      _navigateToAccess();
    } else {
      setState(() => index++);
    }
  }

  void _navigateToAccess() {
    GoRouter.of(context).pushNamed(AppRoute.access.name);
  }
}

class TutorialModel {
  TutorialModel({
    required this.image,
    required this.titleKey,
    required this.descriptionKey,
  });

  final String image;
  final String titleKey;
  final String descriptionKey;
}