import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeButton extends StatelessWidget {
  final String text;
  final Function callback;
  final double padding;

  AdaptativeButton({this.text, this.callback, this.padding});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(text),
            padding: EdgeInsets.all(padding),
            onPressed: callback,
          )
        : RaisedButton(
            child: Text(text),
            onPressed: callback,
          );
  }
}
