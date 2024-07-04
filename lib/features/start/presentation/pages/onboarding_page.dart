import 'package:clean_architecture/i18n/translations.dart';
import 'package:clean_architecture/resources/res.dart';
import 'package:clean_architecture/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;

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
              tutorialModels[index].title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: Dimension.paddingS,
            ),
            Text(
              tutorialModels[index].description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: 19,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: tutorialModels.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: Dimension.padding,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => setState(() {
                      this.index = index;
                    }),
                    child: Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        height: this.index == index ? 19 : 17,
                        width: this.index == index ? 19 : 17,
                        decoration: BoxDecoration(
                          color: this.index == index
                              ? AppColors.primaryColor650
                              : AppColors.primaryColor650.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(19),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Dimension.paddingM,
            ),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    backgroundColor: const WidgetStatePropertyAll(AppColors.tertiary),
                  ),
              onPressed: () {
                if (index == tutorialModels.length - 1) {
                  GoRouter.of(context).pushNamed(AppRoute.access.name);
                } else {
                  setState(() {
                    index++;
                  });
                }
              },
              child: Text(translation.generic.continueTxt),
            ),
            TextButton(
              onPressed: () => GoRouter.of(context).pushNamed(AppRoute.access.name),
              child: Text(translation.generic.skip),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialModel {
  TutorialModel({
    required this.image,
    required this.title,
    required this.description,
  });
  final String image;
  final String title;
  final String description;
}

List<TutorialModel> tutorialModels = [
  TutorialModel(
    image: ImageSrc.tutorial1,
    title: translation.tutorial.tutorialFirstMessageTitle,
    description: translation.tutorial.tutorialFirstMessageDescription,
  ),
  TutorialModel(
    image: ImageSrc.tutorial2,
    title: translation.tutorial.tutorialSecondMessageTitle,
    description: translation.tutorial.tutorialSecondMessageDescription,
  ),
  TutorialModel(
    image: ImageSrc.tutorial3,
    title: translation.tutorial.tutorialThirdMessageTitle,
    description: translation.tutorial.tutorialThirdMessageDescription,
  ),
];
