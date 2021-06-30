import 'package:flutter/material.dart';

class _ScalingFactorBindingScope<T> extends InheritedWidget {
  const _ScalingFactorBindingScope({
    Key key,
    this.scalingFactorBindingState,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final _TextScalerState<T> scalingFactorBindingState;

  @override
  bool updateShouldNotify(_ScalingFactorBindingScope old) {
    return true;
  }
}

class TextScaler<T> extends StatefulWidget {
  TextScaler({
    Key key,
    @required this.initialScaleFactor,
    this.child,
  })  : assert(initialScaleFactor != null),
        super(key: key);

  final T initialScaleFactor;
  final Widget child;

  @override
  _TextScalerState<T> createState() => _TextScalerState<T>();

  static T of<T>(BuildContext context) {
    final _ScalingFactorBindingScope<T> scope = context
        .dependOnInheritedWidgetOfExactType<_ScalingFactorBindingScope<T>>();
    return scope?.scalingFactorBindingState?.currentValue;
  }

  static void update<T>(BuildContext context, T newModel) {
    final _ScalingFactorBindingScope<dynamic> scope = context
        .dependOnInheritedWidgetOfExactType<_ScalingFactorBindingScope<T>>();
    scope?.scalingFactorBindingState?.updateModel(newModel);
  }
}

class _TextScalerState<T> extends State<TextScaler<T>> {
  T currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialScaleFactor;
  }

  void updateModel(T newModel) {
    if (newModel != currentValue) {
      setState(() {
        currentValue = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ScalingFactorBindingScope<T>(
      scalingFactorBindingState: this,
      child: widget.child,
    );
  }
}
