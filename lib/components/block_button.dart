import 'package:flutter/material.dart';

import '../constants.dart';

class BlockButton extends StatelessWidget {
  BlockButton({this.child, this.onTap});

  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: child,
        ),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainerColor,
      ),
    );
  }
}
