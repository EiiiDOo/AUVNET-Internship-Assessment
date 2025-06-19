import 'package:auvnet_internship_assessment/features/home/presentation/widgets/advertising_card.dart';
import 'package:flutter/material.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/advertising_entity.dart';
import 'page_indicator.dart';

class AdvertisingPageView extends StatefulWidget {
  final List<AdvertisingEntity> advertisements;
  final double? height;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final bool autoPlay;
  final Duration autoPlayDuration;

  const AdvertisingPageView({
    super.key,
    required this.advertisements,
    this.height,
    this.margin,
    this.borderRadius,
    this.autoPlay = true,
    this.autoPlayDuration = const Duration(seconds: 3),
  });

  @override
  State<AdvertisingPageView> createState() => _AdvertisingPageViewState();
}

class _AdvertisingPageViewState extends State<AdvertisingPageView> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.autoPlay && widget.advertisements.length > 1) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayDuration, () {
      if (mounted && _pageController.hasClients) {
        final nextIndex = (_currentIndex + 1) % widget.advertisements.length;
        _pageController.animateToPage(
          nextIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _startAutoPlay();
      }
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          widget.margin ??
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          _buildPageView(context),
          const SizedBox(height: 12),
          _buildIndicators(),
        ],
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return SizedBox(
      height: widget.height ?? context.screenHeight * 0.25,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: widget.advertisements.length,
        itemBuilder: (context, index) {
          return AdvertisingCard(
            advertisement: widget.advertisements[index],
            borderRadius: widget.borderRadius,
          );
        },
      ),
    );
  }

  Widget _buildIndicators() {
    if (widget.advertisements.length <= 1) {
      return const SizedBox.shrink();
    }

    return PageIndicator(
      currentIndex: _currentIndex,
      totalCount: widget.advertisements.length,
      onTap: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
