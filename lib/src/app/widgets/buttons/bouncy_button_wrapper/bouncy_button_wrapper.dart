library src.app.widgets.bouncy_button_wrapper;

import 'dart:io';

import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BouncyButtonWrapper extends StatefulWidget {
  final bool hardCancelOnMove;
  final Widget child;
  final VoidCallback? onPressed;
  final Duration? animationDuration;
  final double scaleFactor;

  const BouncyButtonWrapper({
    super.key,
    required this.child,
    this.onPressed,
    this.hardCancelOnMove = false,
    this.animationDuration,
    this.scaleFactor = 0.75,
  });

  @override
  State<BouncyButtonWrapper> createState() => _BouncyButtonWrapperState();
}

class _BouncyButtonWrapperState extends State<BouncyButtonWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bouncyAnimationController;
  late final Animation<double> _bouncyAnimation;

  void _initAnimation() {
    _bouncyAnimationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 100),
      vsync: this,
    );

    _bouncyAnimation = Tween<double>(
      begin: 1,
      end: widget.scaleFactor,
    ).animate(
      CurvedAnimation(
        parent: _bouncyAnimationController,
        curve: Curves.easeIn,
      ),
    );
  }

  void _onPointerDown() {
    if (!mounted) {
      return;
    }
    _bouncyAnimationController.forward();
  }

  void _onPointerUp() {
    if (!mounted) {
      return;
    }
    _bouncyAnimationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _bouncyAnimationController.dispose();
    super.dispose();
  }

  final _buttonKey = GlobalKey();

  bool _buttonContainsPointer = false;

  void _checkPointerMoveAway(Offset pointerPosition) {
    if (!mounted) {
      return;
    }

    if (widget.hardCancelOnMove && !Platform.isAndroid) {
      _buttonContainsPointer = false;
      _bouncyAnimationController.reverse();
    } else {
      final renderBox =
          _buttonKey.currentContext?.findRenderObject() as RenderBox?;

      final boxPosition = renderBox?.localToGlobal(Offset.zero);

      if (boxPosition is Offset &&
          pointerPosition.dy >= boxPosition.dy &&
          boxPosition.dy + renderBox!.size.height >= pointerPosition.dy &&
          boxPosition.dx <= pointerPosition.dx &&
          boxPosition.dx + renderBox.size.width >= pointerPosition.dx) {
        _buttonContainsPointer = true;

        if (!_bouncyAnimationController.isAnimating) {
          _bouncyAnimationController.forward();
        }
      } else {
        _buttonContainsPointer = false;
        _bouncyAnimationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) => Listener(
        key: _buttonKey,
        onPointerMove: widget.onPressed is! VoidCallback
            ? null
            : (event) => _checkPointerMoveAway(event.position),
        onPointerDown: widget.onPressed is! VoidCallback
            ? null
            : (event) {
                _buttonContainsPointer = true;
                _onPointerDown();
              },
        onPointerUp: (event) {
          _onPointerUp();
          if (_buttonContainsPointer) {
            widget.onPressed?.call();
          }
        },
        child: ScaleTransition(
          scale: _bouncyAnimation,
          child: Container(
            color: AppColors.transparent,
            child: widget.child,
          ),
        ),
      );
}
