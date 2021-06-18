import 'package:flutter/material.dart';
import 'package:pageview/slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: OnBording(),
    );
  }
}

class OnBording extends StatefulWidget {
 @override
  _OnBordingState createState() => _OnBordingState();
}
class _OnBordingState extends State<OnBording> {
  int _currentpages=0;
  PageController _controller=PageController();
  List<Widget> pages=[
    sliderpage(
    title:"Keep Save" ,
    image: "images/q1.png",
    description: "Accep Cryptcurrencies and digital assets, keep thern here, or send to others",
    ),
     sliderpage(
    title: "Buy & Invest",
    image: "images/q2.png",
    description:"Buy Bitcoin and Cryptcurrencies with VISA and MasterVard right in the App " ,
    ),
     sliderpage(
    title:"Sell & Exchage" ,
    image: "images/q3.png",
    description:"Sell Your Bitcoin Cryptcurrencies or change with others digital assets " ,
    ),
  ];
   _onChanged(int index){
     setState(() {
       _currentpages=index;
     });

   }

 @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     body: Stack(
       children:[
         PageView.builder(
           scrollDirection: Axis.horizontal,
           controller: _controller,
           itemCount: pages.length,
           onPageChanged: _onChanged,
           itemBuilder: (context,int index){
             return pages[index];
           }
          
           ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
             children: List<Widget>.generate(pages.length,  (int index) {
               return AnimatedContainer(duration: Duration(microseconds:300),
               height:10,
               width:(index==_currentpages) ? 30:10 ,
               margin: EdgeInsets.symmetric(horizontal:5,vertical:30),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: (index==_currentpages) ?
                 Colors.blue:
                 Colors.blue.withOpacity(0.5),
               ),
               );
             }
             ),
              
            ),
            InkWell(
                onTap: (){
                  _controller.nextPage(duration:Duration( microseconds:800),
                   curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(duration: Duration(microseconds:300),
                height: 50,
                alignment: Alignment.center,
                 width:(_currentpages==pages.length-1) ? 200:70 ,
                 decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(30),
                 color: Colors.blue
                 ),
                 child:(_currentpages==pages.length-1) ?Text("Get Start",style: TextStyle(color: Colors.white,fontSize:20),
                 ):
Icon(Icons.navigate_next,
color: Colors.white,size: 50,)
                ),
              ),
              SizedBox(height:20)
          ],
        ),

       ]
     ),
    );
  }
}
