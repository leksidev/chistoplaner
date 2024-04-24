import 'package:chistoplaner/features/cleaning_plan/list_of_zones/home.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final router = GoRouter(
  observers: [
    TalkerRouteObserver(
      GetIt.I<Talker>(),
    ),
  ],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
