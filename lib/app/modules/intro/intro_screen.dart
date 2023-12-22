import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart' as page;
import 'package:rotation_market_shoes/app/core/theme/colors.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:rotation_market_shoes/app/modules/home/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _position = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          1,
        ),
      )..addListener(() {
          setState(() {});
        }),
    );
    _opacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          1,
        ),
      )..addListener(() {
          setState(() {});
        }),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: AppColors.myBlack,
        child: Stack(
          children: [
            Positioned(
              bottom: -250,
              child: Container(
                width: size.width,
                height: size.width + 250,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [AppColors.myOrange, AppColors.myBlack],
                    radius: .65,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(
                  50.0,
                ),
                width: size.width,
                child: Image.asset('assets/img_nike_text.png'),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(
                  50.0,
                ),
                width: size.width,
                child: Image.asset(
                  'assets/img_shoes.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 40.0,
                ),
                height: size.height / 2,
                width: size.width,
                child: Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'LIVE YOUR\nPERFECT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Smart, gorgeous & fashionable\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if (details.delta.dy < -sensitivity) {
                          // caso arraste o iconepara cima
                          // Navigator.push(
                          //   context,
                          //   page.PageTransition(
                          //     child: HomeScreen(),
                          //     type: page.PageTransitionType.bottomToTop,
                          //   ),
                          // );
                          Navigator.push(
                            context,
                            page.PageTransition(
                              child: HomeScreen(),
                              type: page.PageTransitionType.bottomToTop,
                            ),
                          );
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 20.0,
                                ),
                                child: Opacity(
                                  opacity: _opacity.value,
                                  child: const Icon(
                                    CommunityMaterialIcons.chevron_double_up,
                                    color: Colors.white,
                                    size: 50.0,
                                  ),
                                ),
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: 'Get Started',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
