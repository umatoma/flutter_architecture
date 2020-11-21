import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateBuilder<T extends ChangeNotifier> extends StatefulWidget {
  const StateBuilder({
    Key key,
    @required this.stateBuilder,
    @required this.builder,
    this.onStateCreated,
  }) : super(key: key);

  final T Function() stateBuilder;
  final Widget Function(BuildContext context, T state) builder;
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

    _state = widget.stateBuilder();
    if (widget.onStateCreated != null) {
      widget.onStateCreated(_state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => _state,
      child: Consumer<T>(
        builder: (context, value, _) => widget.builder(context, value),
      ),
    );
  }
}
