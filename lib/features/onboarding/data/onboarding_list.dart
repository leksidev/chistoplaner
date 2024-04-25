import 'package:chistoplaner/features/onboarding/model/onboading_data_model.dart';
import 'package:flutter/material.dart';

List<OnboardingDataModel> onboardingList = [
  OnboardingDataModel(
    image: 'assets/images/onboarding/kitchen.png',
    title: 'Планируйте',
    description:
        'Планируйте уборку на кухне, в спальне, \nв детской или в офисе.',
    backgroundColor: const Color.fromARGB(255, 238, 155, 85),
  ),
  OnboardingDataModel(
    image: 'assets/images/onboarding/bedroom.png',
    title: 'Управляйте',
    description:
        'Устанавливайте напоминания и используйте таймер \nдля контроля потраченного времени.',
    backgroundColor: const Color.fromARGB(255, 132, 235, 240),
  ),
  OnboardingDataModel(
    image: 'assets/images/onboarding/office.png',
    title: 'Контролируйте',
    description:
        'Назначайте ответственных за чистоту \nи разделяйте обязанности.',
    backgroundColor: const Color.fromARGB(255, 243, 83, 107),
  ),
];
