import 'package:flutter/material.dart';
class sliderpage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const sliderpage({
   this.image, 
   this.title,
   this.description
   });
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,width: width*4.0,),
          SizedBox(height:60),
          Text(title,style:TextStyle(fontSize:28,fontWeight:FontWeight.bold),),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(description,style:TextStyle(height:1.5,fontSize:14,fontWeight:FontWeight.normal,letterSpacing: 0.7),
            textAlign: TextAlign.center,
            ),
          ),

  SizedBox(height:60),
        ],
      ),
      
    );
  }
}