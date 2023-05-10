import 'package:flutter/material.dart';
import 'package:user_app/Common_Widgets/custombutton.dart';
import 'package:user_app/Common_Widgets/customtextformfield.dart';
import 'package:user_app/Firebaseservices/services.dart';
import 'package:user_app/Models/registrationmodel.dart';
import 'package:user_app/Screens/registereduser_page.dart';

class UpdateRegisteredUser extends StatefulWidget {
  RegistrationModel ? users;

  UpdateRegisteredUser({
    this.users
  }); 

  @override
  State<UpdateRegisteredUser> createState() => _UpdateRegisteredUserState();
}

class _UpdateRegisteredUserState extends State<UpdateRegisteredUser> {
 FireServices rc = FireServices();
 TextEditingController name = TextEditingController();

 TextEditingController email = TextEditingController();

 TextEditingController age = TextEditingController();

 TextEditingController password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.users);
    name.text = widget.users!.name;
    age.text = widget.users!.age;
    email.text = widget.users!.email;
    password.text = widget.users!.password;
  }
  @override
  Widget build(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisteredUserPage()));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update Registered User"),
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
                  CustomTextFormField(
                    w: w * 0.9,
                    hintText: "name",
                    controller: name,
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
                    w:  w * 0.9,
                    hintText: "age",
                    controller: age,
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
                      if(name == null || email == null || age == null || password == null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar
                        (
                          backgroundColor: Colors.blue,
                          content: Text("Please fill all the fields")
                        )
                        );
                      }
                      if(int.parse(age.text) < 18){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar
                        (
                          backgroundColor: Colors.blue,
                          content: Text("Age should be above 18"),
                        )
                        );
                      }
                      else{
                        final user = RegistrationModel(id: widget.users!.id,name: name.text, email: email.text, age: age.text, password: password.text);
                        rc.updateUser(user);
                        setState(() {
                          name.text = "";
                          email.text = "";
                          age.text = "";
                          password.text = "";
                        });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisteredUserPage()));
                      }
                    },
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}