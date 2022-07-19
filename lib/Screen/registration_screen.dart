import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {

//first name field
     // ignore: unused_local_variable
     final firstNameField= TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
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
        onPressed: (){},
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
}