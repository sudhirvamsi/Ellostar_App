import 'package:ellostars/home_page.dart';
import 'package:ellostars/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class login_page extends StatefulWidget {

   login_page({super.key});

  //text editing controllers


  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool passToggle = true;


  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (value.length < 4) {
      return 'Username must be at least 4 characters long';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter and one number';
    }
    return null;
  }

  @override
  void dispose(){
    _usernameController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login action (e.g., API call)
      print('Username: ${_usernameController.text}');
      print('Password: ${_passwordController.text}');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              //logo
              Image.asset('assets/logo/ellostars.png',
              width: 200,
              ),
              SizedBox(height: 50,),
              
              //welcome back
              Text('Start your freelancing journey here', style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18, fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 35),

              //username textfiled
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            key: _formKey,
            child: TextFormField(
              textInputAction: TextInputAction.next,
              controller: _usernameController,


              decoration: InputDecoration(

                prefixIcon: Icon(Icons.person, color: Colors.orange,),
                hintText: "Enter your user name",
                hintStyle: TextStyle(color: Colors.black26),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),

                ),
                fillColor: Colors.orange.shade50,
                filled: true,
              ),
              validator: _validateUsername,

            ),

          ),

          SizedBox(height: 10,),

              //password textfiled

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextFormField(
              obscureText: passToggle,
              controller: _passwordController,
              decoration: InputDecoration(
                suffix: InkWell(
                  onTap:(){
                    setState(() {
                      passToggle =!passToggle;
                    });
                  },
                  child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                ),

                prefixIcon: Icon(Icons.lock, color: Colors.orange,),
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.black26),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade400),

                ),
                fillColor: Colors.orange.shade50,
                filled: true,
              ),
              validator: _validatePassword,
            ),
          ),

              SizedBox(height: 10,),


              //forget password

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',style: TextStyle(
                      color: Colors.grey.shade600
                    ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25,),

              //sign in button

              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 25),


                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: GestureDetector(
                  onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context){
                        return home_page();

                      }), (route) => false);
                  },
                  child: Center(
                    child: (
                        Text('Sign In', style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),)
                    ),
                  ),
                ),
              ),


              SizedBox(height: 50,),

              // not a member? register now

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?', style: TextStyle(
                    color: Colors.black38, fontSize: 14
                  ),),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return register();
                      })
                      );
                    },
                    child: Text('Register now', style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),

    );
  }
}
