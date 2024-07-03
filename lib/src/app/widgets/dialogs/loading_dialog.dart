library src.app.widgets.dialogs.loading;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final double boxSize;
  final Color? boxColor;
  final Color barrierColor;
  final Color? circularLoaderColor;
  final double circularLoaderWidth;
  final BorderRadius borderRadius;
  final Widget? customLoader;

  const LoadingDialog({
    super.key,
    this.boxSize = 60,
    this.boxColor,
    this.barrierColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.circularLoaderColor,
    this.circularLoaderWidth = 1.5,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
    this.customLoader,
  });

  Future<T?> show<T>({
    required BuildContext context,
    Color? barrierColor,
    bool barrierDismissible = false,
  }) async =>
      await showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        useRootNavigator: false,
        builder: (_) => LoadingDialog(
          boxSize: boxSize,
          boxColor: boxColor ?? context.color.background,
          circularLoaderWidth: circularLoaderWidth,
          circularLoaderColor: circularLoaderColor,
          customLoader: customLoader,
        ),
      );

  FutureOr<void> hide<T extends Object?>(
    BuildContext context, {
    Duration? delayDuration,
    VoidCallback? callBack,
  }) =>
      Future(
        () => delayDuration is Duration
            ? Future.delayed(
                delayDuration,
                context.mounted ? context.router.popForced<T> : null,
              )
            : context.router.popForced<T>(),
      ).then(
        (_) => callBack?.call(),
      );

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: Center(
          child: Material(
            color: boxColor,
            borderRadius: borderRadius,
            child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: customLoader ??
                  Center(
                    child: CircularProgressIndicator(
                      strokeWidth: circularLoaderWidth,
                      color: circularLoaderColor ?? context.color.activeDeep,
                    ),
                  ),
            ),
          ),
        ),
      );
}
