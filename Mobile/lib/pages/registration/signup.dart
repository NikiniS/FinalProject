import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

import '../../components/text_field.dart';
import '../../controller/user_controller.dart';
import '../../theme/color_pallete.dart';
import 'login.dart';

class SignupBodyScreen extends StatefulWidget {
  const SignupBodyScreen({super.key});

  @override
  State<SignupBodyScreen> createState() => _SignupBodyScreen();



}

class _SignupBodyScreen extends State<SignupBodyScreen> {

  // registers a user
  Future<bool> register(String username,String email,String address,String password,String confirmPassword) async {

    if(username.isEmpty || email.isEmpty || address.isEmpty || password.isEmpty){

      showErrorMessage("Please Fill all the Fields");
      return false;
    }

    if(password!=confirmPassword){

      showErrorMessage("Password miss matched");
      return true;
    }

    if(!validateEmail(email)){

      showErrorMessage("Provide email is not a valid email");
      return true;
    }

    Map<String,dynamic> result = await UserController().RegisterUser(username, password, email, address);

    print(result);

    setState(() {
      signingIn = false;
    });

    try{

      if(result['message']=="success"){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Center( child:Text("Registered Successfully")),
            )
        );
        return true;
      }
      else if(result['message']=="duplicate key"){
        showErrorMessage("Account Already Taken");
        return false;
      }
      else{
        return false;
      }
    }
    catch(e){
      return false;
    }

  }

  void showErrorMessage(String message) {
    // error dialog popup
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 200,
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center( child:Text(message)),
      ),
    );
  }

  String _errorMessage = "";
  bool signingIn = false;

  bool validateEmail(String val) {
    if (val.isEmpty) {
      // validate email
      return false;
    } else if (!EmailValidator.validate(val, true)) {
      // not a valid email

      return false;
    } else {
      return true;
    }
  }


  final GlobalKey<FormState> _formKey = GlobalKey();


  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _conFirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    color: ColorSchema.lightGreen,
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(50),bottomLeft:Radius.circular(50) )
                ),
                child:Center(

                    child: Column(
                      children: [

                        const SizedBox(height: 30),
                        Text("IRelax",style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: ColorSchema.white,
                        ),)
                      ],
                    )

                ),
              ),

              const SizedBox(height: 50),
              Text(
                "Discover serenity through personalized relaxation experiences guided by facial detection technology, tailored to your unique stress levels and facial expressions",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: ColorSchema.darkGreen,

                )
                ,textAlign:TextAlign.center,

              ),
              const SizedBox(height: 50),
              MyTextField(
                controller: _usernameController,
                hintText: "enter username",
                obscureText: false,
                prefixIcon: const Icon(Icons.account_box_outlined,color: ColorSchema.darkGreen,),

              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _emailController,
                hintText: "enter email",
                obscureText: false,
                prefixIcon: const Icon(Icons.mail_outline,color: ColorSchema.darkGreen,),
              ),
              const SizedBox(height: 10),

              MyTextField(
                controller: _addressController,
                hintText: "enter address",
                obscureText: false,
                prefixIcon: const Icon(Icons.location_city_outlined,color: ColorSchema.darkGreen,),

              ),

              const SizedBox(height: 10),
              MyTextField(
                controller: _passwordController,
                hintText: "enter password",
                obscureText: true,
                prefixIcon: const Icon(Icons.password_outlined,color: ColorSchema.darkGreen,),

              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: _conFirmPasswordController,
                hintText: "enter confirmed password",
                obscureText: true,
                prefixIcon: const Icon(Icons.password_outlined,color: ColorSchema.darkGreen,),

              ),

              const SizedBox(height: 50),
              Column(
                children: [

                  FractionallySizedBox(

                      widthFactor: 0.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: ColorSchema.darkGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),

                          ),
                        ),
                        onPressed: ()async{


                          bool isValidRegister = await register(_usernameController.text,
                              _emailController.text, _addressController.text,
                              _passwordController.text,_conFirmPasswordController.text);

                          if(isValidRegister){
                            Navigator.push(

                              context,
                              MaterialPageRoute(builder: (context) =>const LoginBodyScreen()),
                            );
                          }




                        }
                        ,
                        child:  Text("Register",style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: ColorSchema.white,
                        )),
                      )
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text("Already have an account",style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: ColorSchema.darkGreen,
                        )),

                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginBodyScreen()));
                          },
                          child: Text("Go to Login",style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: ColorSchema.lightGreen,
                          )),
                        )
                      ]
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
    );

  }


}