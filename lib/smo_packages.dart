import 'package:ellostars/gold_packages.dart';
import 'package:ellostars/silver_package.dart';
import 'package:ellostars/smo_details.dart';
import 'package:flutter/material.dart';
class smo_packages extends StatefulWidget {
  const smo_packages({super.key});

  @override
  State<smo_packages> createState() => _smo_packagesState();
}

class _smo_packagesState extends State<smo_packages> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('OUR PACKAGES', style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          backgroundColor: Colors.blue.shade700,
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
               child: Text(
                 'Silver Packages', style: TextStyle(
                 fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold
               ),

               ),
                height: 100,

              ),

              Tab(
                child: Text(
                  'Gold Packages', style: TextStyle(
                    fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold
                ),
                ),
                height: 100,

              ),

            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return smo_package();
              })
              );
            },


          ),
      
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              Container(
              child: silver_packages(),
              ),
          
              Container(
                color: Colors.lightBlueAccent,
                child: (
                  gold_packages()
                ),
              ),
            ],
          ),
        ),

      
      ),
    );
  }
}
