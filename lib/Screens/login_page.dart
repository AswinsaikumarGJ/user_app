import 'package:flutter/material.dart';
import 'package:user_app/Common_Widgets/custombutton.dart';
import 'package:user_app/Common_Widgets/customtextformfield.dart';
import 'package:user_app/Firebaseservices/services.dart';
import 'package:user_app/Models/registrationmodel.dart';
import 'package:user_app/Screens/registereduser_page.dart';
import 'package:user_app/Screens/registration_page.dart';

import '../Common_Widgets/customtext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 FireServices service = FireServices();

 TextEditingController email = TextEditingController();

 TextEditingController password= TextEditingController();
  @override
  Widget build(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                w: w * 0.9,
                hintText: "email",
                controller: email,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                w: w * 0.9,
                hintText: "password",
                controller: password,
              ),
              SizedBox(
                height: 20,
                ),
              CustomButton(
                onPressed: (){
                  if( email == null ||  password == null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar
                    (
                      backgroundColor: Colors.blue,
                      content: Text("Please fill all the fields")
                    )
                    );
                  }
                  else{
                    final user = RegistrationModel(email: email.text, password: password.text);
                    service.loginuser(user);
                    setState(() {
                      email.text = "";
                      password.text = "";
                    });
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisteredUserPage()));
                  }
                },
              ),
               SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                },
                child: CustomText(
                  text: "Register User!",
                  size: 20,
                  underline: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}