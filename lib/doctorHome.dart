import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _HFRCreation = Uri.parse('https://facility.ndhm.gov.in/');
final Uri _HPRCreation = Uri.parse('https://hprid.abdm.gov.in/');


class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  _DoctorHomeState createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Customer Home'),
        centerTitle: true,
        backgroundColor: AppTheme.appBarColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              HPRidCreationButton(),
              SizedBox(height: 20),
              HFRidCreationButton()
            ],
          ),
        ),
      ),
    );
  }

  TextButton HPRidCreationButton() {
    //Add interim step to get name, phone number, email (optional) and aadhar ID, location
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Create HPR ID', style: TextStyle(fontSize: 20)),
        onPressed: _launchHPRCreation
    );
  }

  Future<void> _launchHPRCreation() async {
    if (!await launchUrl(_HPRCreation)) {
      throw Exception('Could not launch $_HPRCreation');
    }
  }

  TextButton HFRidCreationButton() {
    //Add interim step to get name, phone number, email (optional) and aadhar ID, location
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Create HFR ID', style: TextStyle(fontSize: 20)),
        onPressed: _launchHFRCreation
    );
  }

  Future<void> _launchHFRCreation() async {
    if (!await launchUrl(_HFRCreation)) {
      throw Exception('Could not launch $_HFRCreation');
    }
  }
}