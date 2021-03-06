import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: kDebugMode
          ? Icon(Icons.error_outline, color: Colors.red)
          : Container(),
    );
  }
}
