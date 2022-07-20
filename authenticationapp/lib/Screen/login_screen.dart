// ignore: file_names, unused_import
import 'package:authenticationapp/Screen/home_screen.dart';
import 'package:authenticationapp/Screen/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);


  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {


  //Form Key
  // ignore: unused_field
  final _formKey =GlobalKey<FormState>();

  //TextEditing controller for TextController

  // ignore: unnecessary_new
  final TextEditingController emailController=new TextEditingController();
  // ignore: unnecessary_new
  final TextEditingController passwordController=new TextEditingController();


  //Firebase Call
  final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    //email field
    // ignore: unused_local_variable
    final emailField= TextFormField(
      autofocus: false,
      controller: emailController,
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
        emailController.text =value!;
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

    //PasswordTextField
    // ignore: unused_local_variable
    final passwordField= TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      // ignore: body_might_complete_normally_nullable
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
        passwordController.text =value!;
      },
      textInputAction: TextInputAction.done,
       decoration:  InputDecoration(
        prefixIcon:const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //Loginbutton
    // ignore: non_constant_identifier_names
    final LoginButton=Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15,),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){

          signIn(emailController.text, passwordController.text);
        },
      child: const Text("Login",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
    );





    return  Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Log In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
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

                     SizedBox(height: 200,
                    child: Image.asset("assets/logo.png",fit: BoxFit.contain,),),

                    emailField,
                    const SizedBox(height: 25,),
                    passwordField,
                    const SizedBox(height: 25,),
                    LoginButton,
                    
                    const SizedBox(height: 25,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don`t have an account ?"),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context)=>
                                 const Registration()));
                          },
                          child: const Text("SignUp",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15,),),
                        )
                      ],
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

  //Login funcations

  void signIn(String email, String password) async
  {
    if(_formKey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(email:email,password:password)
      .then((uid)=>{
         Fluttertoast.showToast(msg: "Login Successfully "),
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const Home())),
      }).catchError((e){
        Fluttertoast.showToast(msg:e!.message);
      });
    }
  }
}