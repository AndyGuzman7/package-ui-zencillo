import 'package:flutter/material.dart';

class FormInherited extends InheritedWidget {
  const FormInherited({
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static FormInherited of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<FormInherited>();
    assert(result != null, 'No FormInherited found in context');
    return result!;
  }

  bool isValid() {
    throw false;
  }

  void clear() => {};

  void dispose() => {};
}
