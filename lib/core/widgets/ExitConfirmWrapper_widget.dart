import 'package:flutter/material.dart';
import 'package:ticket/core/widgets/ExitConfirmDialog.dart';

class ExitConfirmWrapper extends StatelessWidget {
  final Widget child;

  const ExitConfirmWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await ExitConfirmDialog.show(context);
        return false;
      },
      child: child,
    );
  }
}
