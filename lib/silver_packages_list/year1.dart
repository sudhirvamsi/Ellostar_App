import 'package:flutter/material.dart';
class year_1 extends StatelessWidget {
  const year_1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 400,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: (
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('1 Year', style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold

                      ),),
                      Text('The quality of output we provide is MEDIUM'),

                      SizedBox(height: 15,),

                      Row(
                        children: [
                          Text('₹\ 4,80,000', style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1.5
                          ),),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.shade50
                            ),
                            child: (
                                Text('SAVE 25%', style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14
                                ),)
                            ),
                          )

                        ],
                      ),
                      SizedBox(height: 15,),
                      Column(
                        children: [
                          Text('Rs 3,60,000/- + 18% GST', style: TextStyle(
                              fontSize: 16
                          ),
                          )
                        ],
                      ),

                      Row(
                        children: [
                          Text('₹', style: TextStyle(
                              fontSize: 25
                          ),),
                          SizedBox(width: 6,),
                          Text('4,24,800', style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 5,),
                          Text('/-', style: TextStyle(
                              fontSize: 25
                          ),)

                        ],
                      ),

                      SizedBox(height: 10,),

                      Container(
                        padding: EdgeInsets.all(18),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),

                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue
                        ),
                        child: Center(
                            child: Text('Choose plan',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 15,),

                      Row(
                        children: [
                          Expanded(child: Divider(
                            color: Colors.grey[700],
                            thickness: 1,
                          )
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('What You Get', style: TextStyle(
                                fontSize: 16
                            ),),
                          ),
                          Expanded(child: Divider(
                            color: Colors.grey[700],
                            thickness: 1,
                          ))
                        ],
                      ),
                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Icon(Icons.arrow_circle_right_outlined, color: Colors.blue[700],),
                          SizedBox(width: 10,),
                          Text('240 Slides', style: TextStyle(fontWeight: FontWeight.w900),),
                          Text(' will be provided throughout the tenure'),

                        ],

                      ),
                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.arrow_circle_right_outlined, color: Colors.blue[700],),
                          SizedBox(width: 10,),
                          Text('60 Reels', style: TextStyle(fontWeight: FontWeight.w900),),
                          Text(' will be provided throughout the tenure'),

                        ],

                      ),

                      SizedBox(height: 5,),

                      Row(

                        children: [
                          Icon(Icons.arrow_circle_right_outlined, color: Colors.blue[700],),
                          SizedBox(width: 10,),
                          Text('Platforms Handled:', style: TextStyle(fontWeight: FontWeight.w900),),

                        ],
                      ),
                      Column(

                        children: [
                          Align(alignment: Alignment.center,),
                          Text('Facebook, Instagram, YouTube, '
                              'Google My Business')],
                      ),

                      SizedBox(height: 5,),

                      Row(

                        children: [
                          Icon(Icons.arrow_circle_right_outlined, color: Colors.blue[700],),
                          SizedBox(width: 10,),
                          Text('Content Management', style: TextStyle(fontWeight: FontWeight.w900),),

                        ],

                      ),


                      Column(

                        children: [
                          Align(alignment: Alignment.center,),
                          Text('Dedicated CRM, Reputation Management, '
                              'Campaign Management')],
                      ),


                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.arrow_circle_right_outlined, color: Colors.blue[700],),
                          SizedBox(width: 10,),

                          Text('Page Monitoring Manager, Monthly Report'),

                        ],

                      ),
                      SizedBox(height: 15,),

                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[50]
                        ),
                        child: Center(
                          child: Text(
                              "Ellostar's commission is 10% = Rs 36,000/- "
                          ),
                        ),
                      )

                    ],
                  )



              ),
            ),
          ),
        ],
      ),
    );
  }
}
