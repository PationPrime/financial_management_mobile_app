library src.app.tools.text_editing_controller_observer;

import 'package:flutter/material.dart';

@immutable
class ValueNotifierListenersObserver<T extends ValueNotifier> {
  /// [ValueNotifier]s that will be listened to by the [generalListener].
  final List<T> notifiers;

  /// The general listener for all [ValueNotifier]s inside [notifiers].
  final Function() generalListener;

  const ValueNotifierListenersObserver({
    required this.notifiers,
    required this.generalListener,
  });

  /// Method adds [generalListener] for each [ValueNotifier] inside [notifiers].
  void _startListening() {
    for (final notifier in notifiers) {
      notifier.addListener(generalListener);
    }
  }

  /// Method removes [generalListener] for each [ValueNotifier] inside [notifiers].
  void _endListening() {
    for (final notifier in notifiers) {
      notifier.removeListener(generalListener);
    }
  }

  /// Method starts listening each [ValueNotifier] indisde [notifiers] by the [generalListener].
  void init() => _startListening();

  /// Method ends listening each [ValueNotifier] indisde [notifiers] by the [generalListener].
  void dispose() => _endListening();
}
