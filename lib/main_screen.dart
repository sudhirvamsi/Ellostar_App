import 'package:ellostars/our_services_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class main_screen extends StatelessWidget {
  const main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow.shade800
                          ),
                        ),
                        Icon(CupertinoIcons.person_fill,color: Colors.brown[900],)
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome',
                          style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w600,
                          color: Colors.black54
                        ),),
                        Text('Sudhir Vasi',style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold,
                          color: Colors.orange
                        ),)
                      ],
                    ),

                  ],
                ),
                IconButton(onPressed: (){},
                    icon: Icon(
                      CupertinoIcons.bell
                    ))
              ],

            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.orange.shade100,
                    offset: Offset(5,5)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Amount', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
                  SizedBox(height: 12,),
                  Text('\₹ 1,00,000.00', style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold,
                      color: Colors.white
                  )),
                  SizedBox(height: 12,),
                  Row(
                    children: [],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                    child: Row(children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          shape: BoxShape.circle
                        ),
                        child: Center(
                          child: Icon(CupertinoIcons.person,
                          size: 15,
                            color: Colors.brown.shade900,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User Id', style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400,
                              color: Colors.white
                          )
                          ),
                          Text('000786', style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600,
                              color: Colors.white
                          )
                          ),

                        ],
                      )

                    ],
                    ),
                  )
                ],
              ),
              
            ),
            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Our Services',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700]
                ),
                ),
                // GestureDetector(
                //   onTap: (){
                //
                //   },
                //   child:
                //   Text('View All',style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.w400,
                //       color: Colors.brown[700]
                //   ),
                //   ),
                // )
              ],
            ),


            SizedBox(height: 20,),



            Expanded(

              child: Padding(
                padding: const EdgeInsets.all(0),
                child: ListView(
                  children: [

                    our_services_list(
                        iconImagePath: 'assets/icons/digital-mar.png',
                        titleTitle: 'Digital Marketing',
                        titleSubTitle: '360° marketing strategy'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/web-dev.png',
                        titleTitle: 'Web Development',
                        titleSubTitle: 'Responsive, Reliable, Remarkable'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/mobile-app.png',
                        titleTitle: "Mobile App's",
                        titleSubTitle: 'Think It, Dream It, We’ll Build It'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/hospital_managment.png',
                        titleTitle: "Hospital Management",
                        titleSubTitle: 'We offer full-fledged 360° '
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/ecommers.png',
                        titleTitle: "Ellocart",
                        titleSubTitle: 'Local Online Shopping App'

                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/location.png',
                        titleTitle: "Ello pages",
                        titleSubTitle: 'Find all you need here'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/kiran-tv.png',
                        titleTitle: "Surya Kiran Tv",
                        titleSubTitle: 'Online Shopping App'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/health.png',
                        titleTitle: "Godavari Health",
                        titleSubTitle: 'Online Shopping App'
                    ),

                    our_services_list(
                        iconImagePath: 'assets/icons/landu.png',
                        titleTitle: "Landu",
                        titleSubTitle: 'Explore new properties'
                    ),
                  ],


                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
