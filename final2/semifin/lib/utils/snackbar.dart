import 'package:flutter/material.dart';

void showSnackBar(BuildContext ctx, String message, bool isError) {
  ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Semantics(
        liveRegion: true,
        child: Text(
          message,
          style: TextStyle(
              color: isError ? Colors.white : Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: isError ? Colors.red : Colors.white,
      padding: const EdgeInsetsDirectional.all(24),
    ),
  );
}
