import 'package:chistoplaner/features/cleaning_plan/list_of_zones/home_page.dart';
import 'package:chistoplaner/features/onboarding/onboarding_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  observers: [
    TalkerRouteObserver(
      GetIt.I<Talker>(),
    ),
  ],
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
