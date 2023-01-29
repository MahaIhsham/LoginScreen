import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getloginscreen/views/screens/dashboard.dart';
import 'package:getloginscreen/views/screens/forgot.dart';
import 'package:getloginscreen/views/screens/signup.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController Username = TextEditingController();
  TextEditingController password = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String? _error;

  bool isLoading = false;


  bool invisible = true;
  bool _isObscure = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    Username.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer (builder: (context, orientation, screenType){
      return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
       child:     Scrollbar(
            isAlwaysShown: true,
          controller: _scrollController,
            child: Container(
              child: SafeArea(
                child:Column(
                  children: [
                    SizedBox(height: 5,),

                    SizedBox( height: Adaptive.h(2),),
                Container(
                    alignment: Alignment.center,
                    height: Adaptive.h(25),
                    // or 12.5.h
                    width: 100.w,
                    child: new Image.asset(
                      'images/logo1.png',
                      fit: BoxFit.cover,
                      height: Adaptive.h(20), // or 12.5.h
                      width: 30.w,
                    )),
Container(
  alignment: Alignment.center,
  height: Adaptive.h(7),
  width: 90.w,
  child: Text(
    "LOGIN ",style: TextStyle(color: Colors.pink.shade200,fontWeight:FontWeight.bold,
  fontSize: 30),

  ),
),
                    Container(
                      height: Adaptive.h(1), // or 12.5.h
                      width: 20.w,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: Colors.black,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                    SizedBox( height: Adaptive.h(3),),

                    Container(
                      alignment: Alignment.center,
                      height: Adaptive.h(10), // or 12.5.h
                      width: 70.w,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: Username,
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                        // Only numbers can be entered
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 8.0),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.always,
labelText: "User name",
                          labelStyle: TextStyle(
                            height: 0.5,
                              fontSize: 20.sp,
                              color: Colors.black,
                          ),
                          hintText: "Enter User Name",
                          hintStyle: TextStyle(

                              fontSize: 16.sp,
                              color: Colors.black54),
suffixIcon:Align(
  alignment: Alignment.bottomCenter,
  widthFactor: 0.1,
  heightFactor: 0.1,
  child: Icon(
    Icons.person,
   size: 20,
  ),
),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return 'Please enter some   Text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Adaptive.h(10), // or 12.5.h
                      width: 70.w,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                          controller: password,
                        autocorrect: true,
                          autofocus: true,
                          obscureText: _isObscure,
                        // Only numbers can be entered
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 8.0),

                          floatingLabelBehavior:
                          FloatingLabelBehavior.always,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            height: 0.5,
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                          hintText: "Enter Password",
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black54),
                          suffixIcon:
                              IconButton(
                                alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.zero,
                              icon: Icon(
                                  _isObscure ? Icons.visibility : Icons.visibility_off,
                                size: 20,),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })),

                          validator: Validators.compose([
                            Validators.required(
                                'Password is required'),
                            /*Validators.patternString(
                                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                                      'Invalid Password')*/
                          ])
                      ),
                    ),
SizedBox( height: Adaptive.h(2),),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:
                        Colors.pink.shade200,
                        borderRadius:
                        BorderRadius.circular(6),
                      ),
                      height: Adaptive.h(6),
                      width: 70.w,
                      child: isLoading
                          ? const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child:
                              CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2.0,
                              )))
                          : ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            setState(() {
                              _error =
                              'Please provide a valid number/password combination';
                            });
                          } else {

                           Get.to(forgot());
                          }
                        },
                        style:
                        ElevatedButton.styleFrom(
                          primary: Colors.pink.shade200,
                        ),
                        child: Text("Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.h(1),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black,),
                          children: <TextSpan>[
                            TextSpan(

                                text:
                                'Forgot your password? ',

                                recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                   Get.to(dashboard());
                                    
                                  },
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontStyle:
                                  FontStyle.normal,
                                  fontSize: 13,
                                ))
                          ],
                        ),
                      ),
                    ),



Container(
                                          height: Adaptive.h(10), // or 12.5.h
                                          width: 100.w,
                                          alignment: Alignment.bottomCenter,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: RichText(
                                                    textAlign: TextAlign.end,
                                                    text: TextSpan(children: <
                                                        TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              "Don't have any account?",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                           color: Colors.black45,
                                                          )),
                                                      TextSpan(
                                                          text: ' Register now',
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap = () {
                                                                  
                                                                  Get.to(signup());
                                                                },
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                             color:
                       Colors.pink.shade200,
                                                            
                                                          )),
                                                    ]),
                                                  ),
                                                )
                                              ]),
                                        )
                  ],
                ) ,
              ),
            ),

          ),
          ),
        ),
      );

    }
    );
  }

}
