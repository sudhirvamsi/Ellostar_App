import 'package:ellostars/digital_marketing_page.dart';
import 'package:ellostars/smo_packages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class smo_package extends StatefulWidget {
  const smo_package({super.key});

  @override
  State<smo_package> createState() => _smo_packageState();
}

class _smo_packageState extends State<smo_package> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
            return  digital_marketing_page();
            })
            );

          },
        ),
      ),

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/bg.png'
                  ),
              fit: BoxFit.fitHeight)

            ),

          ),

          SizedBox(height: 10,),

          Expanded(child:
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            children: [
             Container(
               child: Column(
                   children: [
                     Text('Benefits of using SMO', style: TextStyle(
                       fontWeight: FontWeight.bold, fontSize: 25,
                         color: Colors.blue
                     ),),
                     Text('(Social Media Optimization) for a business :', style: TextStyle(
                       fontSize: 16
                     ),)
                   ],
                 ),
             ),


              SizedBox(height: 10,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Traffic:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Drives significant website traffic, '
                        'ranking second after search engines and email marketing.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Visibility:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Increases website visibility via social networks,'
                        ' forums, and online communities.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Communication:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Enhances customer connectivity with '
                        'alternative support channels.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Advertising:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Serves as a powerful, free advertising medium on social platforms.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Targeting:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Facilitates precise audience targeting, local or global.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Satisfaction:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Enhances credibility with quick customer responses.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Updates:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Ideal for timely announcements such as product launches and news.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Paid Options:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Offers cost-effective advertising like Facebook and Twitter Ads.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Relationships:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Build trust through direct interaction and feedback.',style:
                    TextStyle(fontSize: 16),),

                    SizedBox(height: 10,),

                    Text('Popularity:', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.w800),),
                    Text('Provides a rapid path to visibility, akin to TV advertising.',style:
                    TextStyle(fontSize: 16),),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return smo_packages();

                  })
                  );

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: (
                  Center(
                    child: (
                        Text('Our Packages', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        )
                    ),
                  )
                  ),

                ),
              )

            ],

          )
          )
        ],
      ),
    );
  }
}
