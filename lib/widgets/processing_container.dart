import 'package:flutter/material.dart';

class ProcessingContainer extends StatelessWidget {
  const ProcessingContainer({
    Key key,
    @required this.isProcessing,
    @required this.child,
  }) : super(key: key);

  final bool isProcessing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        ),
        if (isProcessing)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.withOpacity(0.1),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
