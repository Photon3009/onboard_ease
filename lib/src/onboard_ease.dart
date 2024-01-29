import 'package:flutter/material.dart';

class OnboardEase extends StatefulWidget {
  final List<Widget> pages;
  final BoxDecoration? indicatorDecoration;
  final BuildContext context;
  const OnboardEase(
      {super.key,
      required this.pages,
      this.indicatorDecoration,
      required this.context});

  @override
  State<OnboardEase> createState() => _CustomOnboardingScreenState();
}

class _CustomOnboardingScreenState extends State<OnboardEase> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return widget.pages[index];
            },
          ),
          Positioned(
            top: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(
                  widget.indicatorDecoration, widget.context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator(
      BoxDecoration? decoration, BuildContext context) {
    List<Widget> indicators = [];
    final int numPages = widget.pages.length;
    for (int i = 0; i < numPages; i++) {
      indicators
          .add(_indicator(i == _currentPage, decoration, context, numPages));
    }
    return indicators;
  }

  Widget _indicator(bool isActive, BoxDecoration? decoration,
      BuildContext context, int numPages) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 2.0,
      width: isActive ? width / (2 * numPages) : width / (3.5 * numPages),
      decoration: decoration ??
          BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
            // borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
    );
  }
}
