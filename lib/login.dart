import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'customer_home.dart';
import 'doctorHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'account_creation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('Create Account'),
        centerTitle: true,
        backgroundColor: AppTheme.appBarColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/arogya-saathi.png'),
              const SizedBox(height: 20),
              userNameTextField(),
              const SizedBox(height: 20),
              passwordTextField(),
              const SizedBox(height: 20),
              loginButton(),
              const SizedBox(height: 20),
              createAccount(),
            ],
          ),
        ),
      ),


    );
  }


  TextButton loginButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppTheme.textColor,
        backgroundColor: AppTheme.buttonColor,
        fixedSize: const Size.fromWidth(200),
      ),
      child: const Text('Login', style: TextStyle(fontSize: 20)),

      onPressed: () async {
        String email = userNameController.text;
        String password = passwordController.text;
        // Try to sign in the user with their email and password.
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);

          // If the sign in was successful, navigate to the customer home page.
          if (userCredential.user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomerHome()),
            );
          }
        } catch (e) {
          // If the sign in failed, print the error message.
          print(e.toString());
        }
      },
    );
  }


  TextFormField userNameTextField() {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Please type your name";
          }
        },
        autofocus: false,
        keyboardType: TextInputType.text,
        controller: userNameController,
        onSaved: (value) {
          userNameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: AppTheme.textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.fromLTRB(25, 15, 25, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: AppTheme.buttonColor,
          filled: true,
          hintStyle: const TextStyle(color: AppTheme.textColor),
        ));
  }

  TextFormField passwordTextField() {
    return TextFormField(
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return "Enter a password to sign up";
          } else if (!regex.hasMatch(value)) {
            return "Valid passwords contain atleast six characters";
          }
        },
        obscureText: true,
        autofocus: false,
        keyboardType: TextInputType.text,
        controller: passwordController,
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              color: AppTheme.textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.fromLTRB(25, 15, 25, 15),
          hintText: "New Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: AppTheme.buttonColor,
          filled: true,
          hintStyle: const TextStyle(color: AppTheme.textColor),
        ));
  }

  TextButton createAccount() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: AppTheme.textColor,
        backgroundColor: AppTheme.buttonColor,
      ),
      child: Text('Create Account'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const accountCreation()),
        );
      },
    );
  }
}