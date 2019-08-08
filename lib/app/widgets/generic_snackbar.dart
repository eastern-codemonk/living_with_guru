import 'package:flutter/material.dart';

/// Returns the app's default snackbar with a [text].
SnackBar _getGenericSnackbar(String text, bool isError) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isError ? Colors.red : Colors.white,
        fontSize: 16.0,
      ),
    ),
  );
}

/// Shows a generic [Snackbar]
void showGenericSnackbar(GlobalKey<ScaffoldState> key, String text,
    {bool isError = false}) {
  key.currentState.showSnackBar(_getGenericSnackbar(text, isError));
}
