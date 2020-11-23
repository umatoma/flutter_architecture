import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const StateBuilder({
    Key key,
    @required this.create,
    @required this.builder,
    this.child,
    this.onStateCreated,
  }) : super(key: key);

  final T Function() create;
  final Widget Function(BuildContext context, T state, Widget child) builder;
  final Widget child;
  final Function(T state) onStateCreated;

  @override
  _StateBuilderState<T> createState() => _StateBuilderState<T>();
}

class _StateBuilderState<T extends ChangeNotifier>
    extends State<StateBuilder<T>> {
  T _state;

  @override
  void initState() {
    super.initState();

    _state = widget.create();
    if (widget.onStateCreated != null) {
      widget.onStateCreated(_state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => _state,
      child: Consumer<T>(
        builder: (BuildContext context, T value, Widget child) {
          return widget.builder(context, value, child);
        },
        child: widget.child,
      ),
    );
  }
}
