import 'package:authenticationapp/Screen/home_screen.dart';
import 'package:authenticationapp/Screen/login_screen.dart';
import 'package:authenticationapp/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  //form key
  // ignore: unused_field
  final _formKey =GlobalKey<FormState>();

  // ignore: unnecessary_new
  final firstNameEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final secondNameEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final emailEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final passwordEditingController = new TextEditingController();
  // ignore: unnecessary_new
  final confirmpasswordEditingController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

//first name field
     // ignore: unused_local_variable
     final firstNameField= TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return("First name cann`t empty");
        }
        if(!regex.hasMatch(value)){
          return("Please Enter valid name(Min. 3 character");

        }
        return null;
      },
      onSaved: (value){
        firstNameEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'First Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //Second name field
     // ignore: unused_local_variable
     final secondNameField= TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        // ignore: unnecessary_new
       
        if(value!.isEmpty){
          return("Second name cann`t empty");
        }
        return null;
       
      },
      onSaved: (value){
        secondNameEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'Second Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //Email field
     // ignore: unused_local_variable
     final emailField= TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ("Please Enter your Email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Enter a Valid Email");

        }
        return null;
      },
      onSaved: (value){
        emailEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


     // Password field
     // ignore: unused_local_variable
     final passwordField= TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
       validator: (value){
        // ignore: unnecessary_new
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return("password is required for login");
        }
        if(!regex.hasMatch(value)){
          return("Please Enter valid password(Min. 6 character");

        }
      },
      onSaved: (value){
        passwordEditingController.text =value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


//Confirm Password field
     // ignore: unused_local_variable
     final confirmPasswordField= TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmpasswordEditingController.text != passwordEditingController.text)
        {
          return "Password don`t match ";
        }
        return null;

      },
      onSaved: (value){
        confirmpasswordEditingController.text =value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

//Signup button

final signUpButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){

          signUp(emailEditingController.text, passwordEditingController.text);

        },
      child: const Text("SignUp",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
    );
  

    return  Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Center(child: Text('Registration')),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child:Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                     SizedBox(height: 180,
                    child: Image.asset("assets/logo.png",fit: BoxFit.contain,),),

                    firstNameField,
                    const SizedBox(height: 20,),
                    secondNameField,
                    const SizedBox(height: 20,),
                    emailField,
                    const SizedBox(height: 20,),
                    passwordField,
                    const SizedBox(height: 20,),
                    confirmPasswordField,
                    const SizedBox(height: 20,),
                    signUpButton,
                    const SizedBox(height: 15,),

                   
  

                   
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    
  }

  void signUp(String email, String password) async
  {
    if(_formKey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
        postDetailsToFirestore()
      }).catchError((e)
      {
       Fluttertoast.showToast(msg:e!.message);
      });

    }
  }

  postDetailsToFirestore() async
  {
    //calling our Firestore
    //Calling our User model 
    //sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all vlaues

    userModel.email=user!.email;
    userModel.uid=user.uid;
    userModel.firstName=firstNameEditingController.text;
    userModel.secondName=secondNameEditingController.text;


    await firebaseFirestore
    .collection('users')
    .doc(user.uid)
    .set(userModel.toMap());


    Fluttertoast.showToast(msg: "Account Create Successfully !");

    Navigator.pushAndRemoveUntil(
      (context),
       MaterialPageRoute(builder: (context)=> const Loginscreen()), 
    (route) => false);





  }
}