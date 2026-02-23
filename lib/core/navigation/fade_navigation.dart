import 'package:flutter/material.dart';
import 'dart:ui';

class FadeNavigation {
  static Future pushFade(BuildContext context, Widget page) {
    return Navigator.of(context).push(_fadeRoute(page));
  }

  static Future pushSlide(BuildContext context, Widget page) {
    return Navigator.of(context).push(_slideRoute(page));
  }

  static Future pushScale(BuildContext context, Widget page) {
    return Navigator.of(context).push(_scaleRoute(page));
  }

  static Future pushFromBottom(BuildContext context, Widget page) {
    return Navigator.of(context).push(_bottomRoute(page));
  }

  static Future pushSplash(BuildContext context, Widget page) {
    return Navigator.of(
      context,
    ).pushAndRemoveUntil(_splashRoute(page), (route) => false);
  }

  static Future bottomToTop(BuildContext context, Widget page) {
    return Navigator.of(context).push(_bottomRoute(page));
  }

  // ─── Fade ────────────────────────────────────────────────────────────────
  static PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }

  // ─── Slide from right ────────────────────────────────────────────────────
  static PageRouteBuilder _slideRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation =
            Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        final fadeAnimation = Tween(begin: 0.3, end: 1.0).animate(animation);

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }

  // ─── Scale ───────────────────────────────────────────────────────────────
  static PageRouteBuilder _scaleRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (_, animation, __) => page,
      transitionsBuilder: (_, animation, __, child) {
        final scaleAnimation = Tween(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: scaleAnimation, child: child),
        );
      },
    );
  }

  // ─── From Bottom (Professional) ──────────────────────────────────────────
  static PageRouteBuilder _bottomRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1050),
      // reverseTransitionDuration: const Duration(milliseconds: 420),
      barrierColor: Colors.black.withOpacity(0.25),
      barrierDismissible: false,
      opaque: false,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideIn = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            );

        final fadeIn = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
          ),
        );

        return Stack(
          children: [
            // ── Glassmorphism Backdrop ──
            FadeTransition(
              opacity: animation,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(color: Colors.black.withOpacity(0.1)),
              ),
            ),

            // ── The Page Content ──
            FadeTransition(
              opacity: fadeIn,
              child: SlideTransition(
                position: slideIn,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.0 * animation.value),
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ─── Splash Transition (Premium Slow Slide-Up) ───────────────────────────
  static PageRouteBuilder _splashRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1050),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideUp =
            Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutQuart),
            );

        final fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
          ),
        );

        return FadeTransition(
          opacity: fadeIn,
          child: SlideTransition(position: slideUp, child: child),
        );
      },
    );
  }
}
