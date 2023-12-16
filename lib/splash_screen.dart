import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/home_screen.dart';
import 'package:my_portfolio/theme/mode_theme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Timer(const Duration(seconds: 3), () {
      // _controller.dispose();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const MyHomePage();
          },
        ),
      );
      // Navigator.pushReplacement(context, MaterialPageRoute(
      //   builder: (context) {
      //     return const MyHomePage();
      //   },
      // ));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Expanded(child: SizedBox()),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Hero(
                      tag: 'avtar',
                      child: Image.asset(
                        'assets/avtar/my_avtar.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ChangeNotifierProvider(
              create: (_) => ModelTheme(),
              child: Consumer<ModelTheme>(
                builder: (context, themeData, child) {
                  return TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    builder: (context, value, child) {
                      return ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return RadialGradient(
                            center: Alignment.center,
                            radius: value * 5,
                            colors: [
                              themeData.isDark ? Colors.blue : Colors.black,
                              Colors.transparent,
                            ],
                            stops: const [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        child: Text(
                          'Bhavy Ukani',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                themeData.isDark ? Colors.blue : Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Expanded(child: SizedBox()),
            const Text("Developed By ZeroCode >_ Dev"),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_portfolio/generated/assets.dart';
// import 'package:my_portfolio/home_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   Timer(
//   //       const Duration(seconds: 2),
//   //       () => Navigator.pushReplacement(context,
//   //           MaterialPageRoute(builder: (context) => const MyHomePage())));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Expanded(child: SizedBox()),
//             Container(
//               clipBehavior: Clip.antiAlias,
//               width: 150,
//               height: 150,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black45,
//                       blurRadius: 20,
//                       offset: Offset(0, 4))
//                 ],
//               ),
//               child: Hero(
//                 tag: 'avtar',
//                 child: Image.asset(Assets.avtarMyAvtar),
//               ),
//             ),
//             const SizedBox(height: 20),
//             glowingText(
//               context,
//               "Bhavy Ukani",
//               const TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             glowingText(
//               context,
//               "Application Developer",
//               const TextStyle(
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Expanded(child: SizedBox()),
//             glowingText(
//               context,
//               "Build by ZeroDev Code >_",
//               TextStyle(
//                 fontFamily: GoogleFonts.ralewayDots().fontFamily,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget glowingText(BuildContext context, String text, TextStyle? textStyle) {
//     return Text(text, style: textStyle);
//   }
// }
