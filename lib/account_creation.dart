import 'package:flutter/material.dart';
import 'app_theme.dart';

class accountCreation extends StatelessWidget {
  const accountCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: AppTheme.appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

          ],
        ),
      ),
    );
  }
}
