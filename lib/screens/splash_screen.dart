import 'package:flutter/material.dart';
import 'package:my_project_first/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
      _controller.forward();
    });

    Future.delayed(Duration(seconds: 6), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 700),
                  child: AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, child) => AnimatedSlide(
                      offset: _slideAnimation.value,
                      duration: const Duration(milliseconds: 700),
                      child: child,
                    ),
                    child: Image.asset(
                      "lib/assets/images/splashscreen.png",
                      width: 140,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 900),
                  child: AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, child) => AnimatedSlide(
                      offset: _slideAnimation.value,
                      duration: const Duration(milliseconds: 900),
                      child: child,
                    ),
                    child: const Text(
                      "Groccery Plus",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: -70,
            top: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(26, 8, 85, 252),
                    Color.fromARGB(26, 233, 30, 98),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // Removed stops for full spread
                ),
              ),
            ),
          ),

          Positioned(
            left: -36,
            top: 100,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(26, 8, 85, 252),
                    Color.fromARGB(26, 233, 30, 98),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // Removed stops for full spread
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
