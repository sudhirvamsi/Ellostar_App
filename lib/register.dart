import 'package:ellostars/login_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();


}

class _registerState extends State<register> {

  final _nameController = TextEditingController();
  final _fatherController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _alternateController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _userController = TextEditingController();
  final _countryController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _addressController = TextEditingController();
  final _referredController = TextEditingController();




  bool isChecked = false;
  void printMessage(){
    print('user accepted the agrement');
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,

        title: Text('Registration'),

        titleTextStyle: TextStyle( fontSize: 22, color: Colors.white,
            fontWeight: FontWeight.bold,),

      ),


      body: Container(
        padding: EdgeInsets.all(20),
        child: (
        ListView(
          shrinkWrap: true,
          children: [

    // Full name

            Text('Your Full Name', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.orange,),
                hintText: "enter your name",
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

            ),


            SizedBox(height: 15,),

    // FATHER / GUARDIAN NAME

            Text('Father / Guardian Name', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _fatherController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.family_restroom, color: Colors.orange,),
                hintText: "enter your father / guardian name",
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

            ),

            SizedBox(height: 15,),

    // PHONE NUMBER

            Text('Mobile Number', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _phonenumberController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.orange,),
                hintText: "enter your mobile number",
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

            ),

            SizedBox(height: 15,),

    // ALTERNATE PHONE NUMBER

            Text('Alternate Number', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _alternateController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.orange,),
                hintText: "enter your alternate number",
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

            ),

            SizedBox(height: 15,),

    // EMAIL ID

            Text('Email Id', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),


            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.email, color: Colors.orange,),
                hintText: "enter your email",
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

            ),

            SizedBox(height: 15,),


// USER NAME

            Text('User Name', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _userController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.orange,),
                hintText: "enter your user name",
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

            ),

            SizedBox(height: 15,),

    // PASSWORD

            Text('Password', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.lock, color: Colors.orange,),
                hintText: "enter your password",
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

            ),

            SizedBox(height: 15,),


    // CONFIRM PASSWORD


            Text('Confirm Password', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _confirmpassController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.lock, color: Colors.orange,),
                hintText: "enter your confirm password",
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

            ),

            SizedBox(height: 15,),

    // COUNTRY


            Text('Country', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _countryController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.map, color: Colors.orange,),
                hintText: "enter your country",
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

            ),

            SizedBox(height: 15,),

    // STATE

            Text('State', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _countryController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.location_city, color: Colors.orange,),
                hintText: "enter your state",
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

            ),

            SizedBox(height: 15,),

    // City

            Text('City', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _cityController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.location_city_sharp, color: Colors.orange,),
                hintText: "enter your city",
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

            ),

            SizedBox(height: 15,),

    // PINCODE

            Text('Pincode', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _pincodeController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.pin, color: Colors.orange,),
                hintText: "enter your pincode",
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

            ),

            SizedBox(height: 15,),

    // ADDRESS

            Text('Address', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _addressController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.location_on_rounded, color: Colors.orange,),
                hintText: "enter your address",
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

            ),

            SizedBox(height: 15,),

    // PROFILE IMAGE

            Text('Profile Image', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(

              decoration: InputDecoration(

                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),

                   child: Container(
                      child: Center(
                        child: (
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor:Colors.orange.shade50 ,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),

                          )),

                          onPressed: ()async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                                allowMultiple: true,
                              type: FileType.custom,
                              allowedExtensions: ['jpg','pdf']
                            );

                            if(result !=null){
                              print(result.paths);

                            }
                          }, child: Text(
                          'Upload Profile',style: (
                           TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                        ),
                        ),

                        )
                        ),
                      ),

                    ),

                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                ),



              ),

            ),

            SizedBox(height: 15,),

    // ADHAAR IMAGE


            Text('Adhaar Image', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(

              decoration: InputDecoration(

                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),

                  child: Container(
                    child: Center(
                      child: (
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor:Colors.orange.shade50 ,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                )),

                            onPressed: ()async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  allowMultiple: true,
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg','pdf']
                              );

                              if(result !=null){
                                print(result.paths);

                              }
                            }, child: Text(
                            'Upload Adhaar',style: (
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                          ),
                          ),

                          )
                      ),
                    ),

                  ),

                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,),
                ),



              ),

            ),

            SizedBox(height: 15,),

    // REFERRED BY


            Text('Referred By', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),

            SizedBox(height: 5,),

            TextField(
              controller: _referredController,
              decoration: InputDecoration(

                prefixIcon: Icon(Icons.people_alt, color: Colors.orange,),
                hintText: "referred",
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

            ),

            SizedBox(height: 15,),

            Container(
              child: (
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isChecked,
                      onChanged: (bool? newValue){
                        setState(() {
                          isChecked = newValue!;
                        });

                      }
                      ),
                  Text('AGREE TO OUR T&C & PRIVACY POLICY',style:
                  TextStyle(
                      fontSize: 13,  color: Colors.black
                  ),),

                ],
              )
              ),
            ),
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(

                child: MaterialButton(
                  onPressed: isChecked? printMessage:null,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return login_page();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22),
                      child: Text('Join As Ellostars Now', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18
                      ),),
                    ),
                  ),
                  textColor: Colors.white,
                  color: Colors.orange,

                ),

              ),
            )

















          ],
        )
        ),
      ),
    );
  }
}
