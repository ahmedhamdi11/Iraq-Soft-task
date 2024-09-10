import 'package:flutter/material.dart';

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget page;
  final TransitionTypeEnum transitionType;
  final Duration duration;
  final Duration reverseDuration;
  CustomPageRouteBuilder({
    required this.page,
    this.transitionType = TransitionTypeEnum.rtlWithFade,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
  }) : super(
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const animationCurve = Curves.ease;
            switch (transitionType) {
              // rtl with fad transition
              case TransitionTypeEnum.rtlWithFade:
                const begin = Offset(1, 0);
                const end = Offset.zero;
                final slidTween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: animationCurve),
                );
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(slidTween),
                    child: child,
                  ),
                );

              // bottom to Top Transition
              case TransitionTypeEnum.bottomToTop:
                const begin = Offset(0, 1);
                const end = Offset.zero;
                final slidTween = Tween<Offset>(begin: begin, end: end).chain(
                  CurveTween(curve: animationCurve),
                );
                return SlideTransition(
                  position: animation.drive(slidTween),
                  child: child,
                );

              // fade transition
              case TransitionTypeEnum.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
            }
          },
        );
}

enum TransitionTypeEnum {
  rtlWithFade,
  bottomToTop,
  fade,
}
