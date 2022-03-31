import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../homepage/homeScreen.dart';
import '../model/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // our form key
  final _formKey = GlobalKey<FormState>();

  //edit controller
  final firsNameEdittingController = new TextEditingController();
  //edit controller
  final secondNameEdittingController = new TextEditingController();
  //edit controller
  final emailEdittingController = new TextEditingController();
  //edit controller
  final passwordEdittingController = new TextEditingController();
  //edit controller
  final confirmPasswordEdittingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    //firstName field
    final firsNameField = TextFormField(
      autofocus: false,
      controller: firsNameEdittingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name(Min. 2 Charater)");
        }
        return null;
      },
      onSaved: (value) {
        firsNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.orangeAccent, width: 2.0),
          ),
          prefixIcon: Icon(Icons.account_circle, color: Colors.orange,),
          contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
          hintText: "FirstName",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //secondName field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEdittingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name(Min. 2 Charater)");
        }
        return null;
      },

      onSaved: (value) {
        secondNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.orangeAccent, width: 2.0),
          ),
          prefixIcon: Icon(Icons.account_circle, color: Colors.orange,),
          contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
          hintText: "SecondName",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

    );

    //email field
    final emailField = TextFormField(

      autofocus: false,
      controller: emailEdittingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        ;
        return null;
      },
      onSaved: (value) {
        emailEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.orangeAccent, width: 2.0),
          ),
          prefixIcon: Icon(Icons.email, color: Colors.orange,),

          contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEdittingController,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password(Min. 6 Charater)");
        }
      },
      onSaved: (value) {
        passwordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.orangeAccent, width: 2.0),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Colors.orange,),
          contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    //confirmpassword field
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEdittingController,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (confirmPasswordEdittingController.text !=
            passwordEdittingController.text) {
          return ("Password don't match");
        }
      },
      onSaved: (value) {
        confirmPasswordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.orangeAccent, width: 2.0),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Colors.orange,),
          contentPadding: EdgeInsets.fromLTRB(12, 15, 20, 15),
          hintText: "ConfirmPassword",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );

    final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orangeAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(12, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEdittingController.text, passwordEdittingController.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    const title = "Chat App";
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home:
      Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
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
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/logo.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      firsNameField,
                      SizedBox(
                        height: 20,
                      ),
                      secondNameField,
                      SizedBox(
                        height: 20,
                      ),
                      emailField,
                      SizedBox(
                        height: 20,
                      ),
                      passwordField,
                      SizedBox(
                        height: 20,
                      ),
                      confirmpasswordField,
                      SizedBox(
                        height: 25,
                      ),
                      signupButton,
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
      Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
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
                  children: [
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    firsNameField,
                    SizedBox(
                      height: 20,
                    ),
                    secondNameField,
                    SizedBox(
                      height: 20,
                    ),
                    emailField,
                    SizedBox(
                      height: 20,
                    ),
                    passwordField,
                    SizedBox(
                      height: 20,
                    ),
                    confirmpasswordField,
                    SizedBox(
                      height: 25,
                    ),
                    signupButton,
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firsNameEdittingController.text;
    userModel.secondName = secondNameEdittingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully!");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => homeScreen()),
            (route) => false);
  }
}
