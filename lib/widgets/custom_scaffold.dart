import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;

  const CustomScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppTheme.lightBlueBackground,
        body: Column(
          children: [
            if (appBar != null) appBar!,
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
