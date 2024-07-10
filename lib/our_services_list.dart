import 'package:ellostars/digital_marketing_page.dart';
import 'package:ellostars/login_page.dart';
import 'package:flutter/material.dart';

class our_services_list extends StatelessWidget {
  final String iconImagePath;
  final String titleTitle;
  final String titleSubTitle;

  const our_services_list({
    super.key,
    required this.iconImagePath,
    required this.titleTitle,
    required this.titleSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(iconImagePath),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleTitle,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        titleSubTitle,
                        style: TextStyle(
                          fontSize: 9.1,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              //Icon

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return digital_marketing_page();
                      }));
                    },
                    child: Icon(Icons.arrow_forward_ios)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
