import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'login.dart';
import 'doctorLogin.dart';
import 'chatBot.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          children: <Widget>[
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 0.2,
                child: patientLoginButton(context),
              ),
            ),
            SizedBox(height: 5), // Spacing between different login buttons
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 0.2,
                child: doctorLoginButton(context),
              ), //fractionallySizedBox
            ),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 0.3,
                heightFactor: 0.2,
                child: chatBotButton(context),
              ), //fractionallySizedBox
            ), //expanded//expanded
          ],
        ),
      ),
    );
  }
}

TextButton patientLoginButton(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: AppTheme.textColor,
      backgroundColor: AppTheme.buttonColor,
    ),
    child: Text('Patient Log in'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    },
  );
}

TextButton doctorLoginButton(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: AppTheme.textColor,
      backgroundColor: AppTheme.buttonColor,
    ),
    child: Text('Doctor Log in'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoctorLogin()),
      );
    },
  );
}

TextButton chatBotButton(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: AppTheme.textColor,
      backgroundColor: AppTheme.buttonColor,
    ),
    child: Text('Chat Bot'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Chatbot()),
      );
    },
  );
}