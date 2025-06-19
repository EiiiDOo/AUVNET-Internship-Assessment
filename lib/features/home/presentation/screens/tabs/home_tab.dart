// home_tab.dart
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/advertising_section.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/discount_code_section.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/nearby_restaurants_section.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/services_section.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/widgets/shortcuts_section.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          CustomAppBar(),
          ServicesSection(),
          DiscountCodeSection(),
          ShortcutsSection(),
          AdvertisingSection(),
          NearbyRestaurantsSection(),
        ],
      ),
    );
  }
}
