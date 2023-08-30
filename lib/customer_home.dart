import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _ABHAurl = Uri.parse('https://www.eka.care/ayushman-bharat/create-abha-abdm-ndhm-health-id?utm_source=%2F&utm_medium=eka-web&utm_campaign=web-navigation');
final Uri _feedbackFormUrl = Uri.parse('https://forms.gle/q8ootF5A3zpJP4v47');
final Uri _incentivesListUrl = Uri.parse('https://hpsbys.in/Application/uploadDocuments/content/Latest_Packages_Ayushman_Bharat_and_HIMCARE_3-compressed.pdf');
final Uri _symptomsCheckUrl = Uri.parse('https://forms.gle/V8ftygkUt2qjjyxn6');
final Uri _helpUrl = Uri.parse('https://docs.google.com/document/d/1hPI4iPwxkb9Rxbl5sQ3T5Uaiu46FulvF3LoKTsTdCMY/edit');
final Uri _workshopSignInurl = Uri.parse('');

class CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

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
              idCreationButton(),
              SizedBox(height: 20),
              workshopSignInButton(),
              SizedBox(height: 20),
              incentivesButton(),
              SizedBox(height: 20),
              symptomsButton(),
              SizedBox(height: 20),
              feedbackButton(),
              SizedBox(height: 20),
              helpButton()
            ],
          ),
        ),
      ),
    );
  }

  //TODO: Add workshop url Link
  //Add youtube channel Link
  //Add seperate channel Link for the trainers to get training videos
  //Add persona button
  //Add doctor google form (both doctor and trainer persona


  TextButton idCreationButton() {
    //Add interim step to get name, phone number, email (optional) and aadhar ID, location
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Create ABHA ID', style: TextStyle(fontSize: 20)),
        onPressed: _launchABHAUrl
    );
  }

  Future<void> _launchABHAUrl() async {
    if (!await launchUrl(_ABHAurl)) {
      throw Exception('Could not launch $_ABHAurl');
    }
  }

  TextButton workshopSignInButton() {
    //Add interim step to get name, phone number, email (optional) and aadhar ID, location
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Sign in to Workshop', style: TextStyle(fontSize: 20)),
        onPressed: _launchWorkshopSignIn
    );
  }

  Future<void> _launchWorkshopSignIn() async {
    if (!await launchUrl(_workshopSignInurl)) {
      throw Exception('Could not launch $_workshopSignInurl');
    }
  }


  TextButton incentivesButton() {
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Healthcare Incentives', style: TextStyle(fontSize: 20)),
        onPressed: _incentivesLaunchUrl
    );
  }

  Future<void> _incentivesLaunchUrl() async {
    if (!await launchUrl(_incentivesListUrl)) {
      throw Exception('Could not launch $_incentivesListUrl');
    }
  }

  TextButton symptomsButton() {
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Symptoms Check', style: TextStyle(fontSize: 20)),
        onPressed: _symptomsLaunchUrl
    );
  }

  Future<void> _symptomsLaunchUrl() async {
    if (!await launchUrl(_symptomsCheckUrl)) {
      throw Exception('Could not launch $_symptomsCheckUrl');
    }
  }

  TextButton feedbackButton() {
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Give Feedback', style: TextStyle(fontSize: 20)),
        onPressed: _launchFeedbackUrl
    );
  }

  Future<void> _launchFeedbackUrl() async {
    if (!await launchUrl(_feedbackFormUrl)) {
      throw Exception('Could not launch $_feedbackFormUrl');
    }
  }

  TextButton helpButton() {
    return TextButton(
        style: TextButton.styleFrom(
          primary: AppTheme.textColor,
          backgroundColor: AppTheme.buttonColor,
          fixedSize: const Size.fromWidth(200),
        ),
        child: Text('Help', style: TextStyle(fontSize: 20)),
        onPressed: _helpLaunchUrl
    );
  }

  Future<void> _helpLaunchUrl() async {
    if (!await launchUrl(_helpUrl)) {
      throw Exception('Could not launch $_helpUrl');
    }
  }


}