import 'package:email_validator/email_validator.dart';
import 'package:final_project/pages/registration/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/button.dart';
import '../../components/text_field.dart';
import '../../controller/user_controller.dart';
import '../../theme/color_pallete.dart';


class LoginBodyScreen extends StatefulWidget {

  static String username="";
  const LoginBodyScreen({super.key});

  @override
  State<LoginBodyScreen> createState() => _LoginBodyScreenState();

}

class _LoginBodyScreenState extends State<LoginBodyScreen> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> signUserIn(String username,String password) async {

    Map<String,dynamic> result = await UserController().LoginUser(username, password);

    print(result);

    setState(() {
      signingIn = false;
    });

  try{
      if(result['message']=="Invalid Creditials"){
        showErrorMessage("Invalid Creditials");
        return false;
      }
      else if(result['message']=="success"){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Center( child:Text("Welcome "+result['user'])),
            ),);
        return true;
      }
      else{
        showErrorMessage("Login Failed");
        return false;
      }}
      catch(e){
        print(e);
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

  void validateEmail(String val) {
    if (val.isEmpty) {
      // validate email
      setState(() {
        _errorMessage = "Provided email is empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      // Validasi jika email tidak valid
      setState(() {
        _errorMessage = "Email is not valid";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorSchema.darkGreen,
        body: ListView(
          padding: const EdgeInsets.fromLTRB(0, 400, 0, 0),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 535,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorSchema.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Log In",
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: ColorSchema.darkGreen,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: ColorSchema.darkGreen,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(

                                    controller: usernameController,
                                    hintText: "enter username",
                                    obscureText: false,
                                    prefixIcon: const Icon(Icons.mail_outline),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Text(
                                      _errorMessage,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Password",
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      color: ColorSchema.darkGreen,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyTextField(
                                    controller: passwordController,
                                    hintText: "enter password",
                                    obscureText: true,
                                    prefixIcon: const Icon(Icons.lock_outline,color: ColorSchema.darkGreen,),

                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  MyButton(

                                    buttonColor: signingIn?ColorSchema.seeBlue:ColorSchema.darkGreen,
                                    onPressed: () async{
                                      setState(() {
                                        signingIn=true;
                                      });



                                      bool isValidLogin = await signUserIn(usernameController.text, passwordController.text);

                                      if(isValidLogin){

                                        LoginBodyScreen.username = usernameController.text;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                             FaceImageScanScreen(),
                                          ),
                                        );

                                      }

                                    },
                                    buttonText: signingIn? 'Please wait' : 'Submit',

                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Padding(padding:
                                        const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                          child: Text("Doesn't have an account yet?",
                                              style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: ColorSchema.darkGreen,

                                              )),

                                        )
                                       ,
                                        Padding(padding:EdgeInsets.fromLTRB(30, 0, 0, 0),
                                            child: TextButton(

                                          child: Text(
                                          "click here",
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            color: ColorSchema.green,
                                          ),
                                        ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const SignupBodyScreen(),
                                ),
                              ),
                            ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(15, -350),
                      child:CircleAvatar(
                        radius: 165,
                        backgroundImage: AssetImage("assets/images/8950209.jpg"),
                      )

                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}