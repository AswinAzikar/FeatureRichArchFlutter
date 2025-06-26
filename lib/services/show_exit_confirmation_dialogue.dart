import 'package:flutter/material.dart';

DateTime? _lastExitAttempt;

Future<bool> showExitConfirmationToast(BuildContext context) async {
  final now = DateTime.now();
  const exitWarningDuration = Duration(seconds: 2);

  if (_lastExitAttempt == null || now.difference(_lastExitAttempt!) > exitWarningDuration) {
    _lastExitAttempt = now;

    // Show a chip toast
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 8),
            Text("Tap once more to exit"),
          ],
        ),
        duration: exitWarningDuration,
      ),
    );

    return Future.value(false); // Do not exit the app
  }

  return Future.value(true); // Exit the app
}
