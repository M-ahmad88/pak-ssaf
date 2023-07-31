import 'package:flutter/material.dart';

import '../string_en.dart';

class PermissionDialog extends StatelessWidget {
  final String message;
  final Function onGranted;
  final Function onDenied;

  PermissionDialog({
    required this.message,
    required this.onGranted,
    required this.onDenied,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.premission_required),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          child: Text(Strings.deny),
          onPressed: () {
            Navigator.of(context).pop();
            if (onDenied != null) onDenied();
          },
        ),
        ElevatedButton(
          child: Text(Strings.grant),
          onPressed: () {
            Navigator.of(context).pop();
            onGranted();
          },
        ),
      ],
    );
  }
}
