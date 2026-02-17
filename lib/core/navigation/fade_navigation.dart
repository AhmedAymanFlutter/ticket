import 'package:flutter/material.dart';

class FadeNavigation {
  /// Push with Hero + Fade animation
  static Future<dynamic> push(BuildContext context, Widget page) {
    return Navigator.of(context).push(_route(page));
  }

  /// Push Replacement with Hero + Fade
  static Future<dynamic> pushReplacement(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(_route(page));
  }

  /// Push And Remove Until (after login مثلا)
  static Future<dynamic> pushAndRemoveUntil(BuildContext context, Widget page) {
    return Navigator.of(
      context,
    ).pushAndRemoveUntil(_route(page), (route) => false);
  }

  /// Route Builder
  static PageRouteBuilder _route(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        /// Fade Animation
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return FadeTransition(opacity: fadeAnimation, child: child);
      },
    );
  }
}
