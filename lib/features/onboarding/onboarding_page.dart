import 'package:chistoplaner/features/onboarding/data/onboarding_list.dart';
import 'package:chistoplaner/features/onboarding/model/onboading_data_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              onPageChanged: (value) => setState(
                () {
                  isLastPage = value == onboardingList.length - 1;
                },
              ),
              controller: _controller,
              children: [
                ...onboardingList.map(
                  (onboardingModel) {
                    return SingleOnboardingScreen(
                      onboardingModel: onboardingModel,
                    );
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 80,
              child: isLastPage
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).buttonTheme.colorScheme?.primary,
                        foregroundColor: Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.onPrimary,
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
                        elevation: 0,
                      ),
                      onPressed: () {
                        GoRouter.of(context).go(
                          '/home',
                        );
                      },
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Positioned(
              bottom: 50,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotHeight: 15,
                  expansionFactor: 5,
                  activeDotColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleOnboardingScreen extends StatelessWidget {
  const SingleOnboardingScreen({
    super.key,
    required this.onboardingModel,
  });

  final OnboardingDataModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 130,
        ),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: onboardingModel.backgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              onboardingModel.image,
              height: 300,
            ),
            const Divider(
              endIndent: 40,
              indent: 40,
              color: Colors.black54,
            ),
            const SizedBox(height: 10),
            Text(
              onboardingModel.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Frenchpress',
                    color: Colors.black54,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Divider(
              endIndent: 40,
              indent: 40,
              color: Colors.black54,
            ),
            const SizedBox(height: 25),
            Text(
              onboardingModel.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black45,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
