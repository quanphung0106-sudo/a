import 'package:flutter/material.dart';

// ignore_for_file: file_names
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //our formkey
  final _formKey = GlobalKey<FormState>();

  //editting Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNamelField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //second name field
    final secondNamelField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      //validator
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      //validator
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //confirm field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      //validator
      onSaved: (value) {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "confirmPassword",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
    //Sigup Button
    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orangeAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () {
              //passing this to our root
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 180,
                          child: CircleAvatar(
                            radius: 150, // Image radius
                            backgroundImage: AssetImage('assets/logo.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        firstNamelField,
                        SizedBox(
                          height: 30,
                        ),
                        secondNamelField,
                        SizedBox(
                          height: 30,
                        ),
                        emailField,
                        SizedBox(
                          height: 30,
                        ),
                        passwordField,
                        SizedBox(
                          height: 30,
                        ),
                        confirmPasswordField,
                        SizedBox(
                          height: 30,
                        ),
                        signupButton,
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ));
  }
}
