import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class digital_marketing_slider extends StatelessWidget {
  const digital_marketing_slider({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: Colors.blue.shade700,
      indicatorBackgroundColor: Colors.white,
      height: 250,
      autoPlayInterval: 4000,
      indicatorRadius: 4,
      isLoop: true,
      children: [
        Padding(padding: EdgeInsets.all(8),
          child: (
          Image.asset('assets/icons/digi.png')
          ),
        ),

        Padding(padding: EdgeInsets.all(8),
          child: (
              Image.asset('assets/icons/seo.png')
          ),
        ),

        Padding(padding: EdgeInsets.all(8),
          child: (
              Image.asset('assets/icons/smo.png')
          ),
        ),

        Padding(padding: EdgeInsets.all(8),
          child: (
              Image.asset('assets/icons/smm.png')
          ),
        )
        
      ],
    );
  }
}
