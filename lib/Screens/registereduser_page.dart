import 'package:flutter/material.dart';
import 'package:user_app/Common_Widgets/customtext.dart';
import 'package:user_app/Firebaseservices/services.dart';
import 'package:user_app/Models/registrationmodel.dart';
import 'package:user_app/Screens/updateregistereduser_page.dart';

class RegisteredUserPage extends StatefulWidget {
  const RegisteredUserPage({super.key});

  @override
  State<RegisteredUserPage> createState() => _RegisteredUserPageState();
}

class _RegisteredUserPageState extends State<RegisteredUserPage> {
  @override
  Widget build(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  FireServices rc = FireServices();
    return Scaffold(
      appBar: AppBar(
        title: Text("Registered Users"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<RegistrationModel>>(
        stream: rc.readUser(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            Center(
              child: 
              CustomText(
              text: "Something went error",
              size: 20,
              )
              );
          }
          if(snapshot.hasData){
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context,index){
                return snapshot.hasData ? InkWell(
                  onTap: (){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (context)=>UpdateRegisteredUser(
                          users: users[index],
                          )
                        )
                        );
                  },
                  child: Container(
                    height: h * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffafafaf).withOpacity(0.5)
                    ),
                    margin: EdgeInsets.all(15),
                    child: Stack(children: [
                       Positioned(
                        top: h * 0.02,
                        left: w * 0.05,
                        child: CustomText(
                          text: users[index].name,
                          size: 17,
                          ),
                       ),
                             Positioned(
                        top: h * 0.065,
                        left: w * 0.05,
                        child: CustomText(
                          text: users[index].age,
                          size: 17,
                          ),
                             ),
                                    Positioned(
                        top: h * 0.11,
                        left: w * 0.05,
                        child: CustomText(
                          text: users[index].email,
                          size: 17,
                          ),
                             ),
                    ]),
                  ),
                ) : Center(
                  child: CircularProgressIndicator()
                  );
              } 
              );
          }
          return SizedBox();
        },
      ),
    );
  }
}