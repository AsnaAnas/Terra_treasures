

import 'package:flutter/material.dart';
import 'package:terra_treasures/modules/user_module/screens/home.dart';

import 'package:terra_treasures/util/constants.dart';

class OnboardingScreen extends StatefulWidget {
 
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController=PageController(initialPage: 0);
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
      //Size size=MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: bgColor,
        actions:  [
          Padding(padding: const EdgeInsets.only(right: 20,top: 20),
          child: InkWell(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>  HomeScreen())),
            child: const Text('Skip',style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,fontWeight: FontWeight.w400),
              ),
          ),),
        ],
      ),
     body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(

         onPageChanged: (int page)
         {
          setState(() {
            currentIndex = page;
          });
         },
         controller: _pageController,
         children: const [
          createPage(image: 'assets/recycle.png',
          title: "Respect the earth, it sustains all",),
           createPage(image: 'assets/reduce.png',
          title: "The greatest threat to our planet is the belief that someone else will save it.",),
           createPage(image: 'assets/reuse.jpg',
          title: "Buy less, choose well. Make it last.",),

         ],
        ),
         Positioned(
          bottom: 80,
          left: 30,
          child: Row(
            children: _buildIndicator(),
          ),),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(4),
               decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
               ),
              child:  IconButton(onPressed: (){
               setState(() {
                 if(currentIndex<2)
                 {
                  currentIndex++;
                  if(currentIndex < 3)
                  {
                    _pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                  }
                 }
                 else
                 {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>  HomeScreen()));
                 }
               });
               
              },
               icon: const Icon(Icons.arrow_forward_ios,size: 24,color: Colors.white,),color: kPrimaryColor,),
            )
          ),
      ],
     ),
    );
  }
  List<Widget> _buildIndicator()
{
  List<Widget> indicators = [];
  for(int i=0;i<3;i++)
  {
    var currentIndex;
    
    if(currentIndex == i)
    {
      indicators.add(_indicator(true));
    }
    else
    {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
}
}



class createPage extends StatelessWidget {
  final String image;
  final String title;
  const createPage({
    super.key, required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image,height:200,width: 200,),
           ),
          const SizedBox(height: 20,),
           Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color:Colors.black,
            fontSize: 24,
    
          ),)
    
        ],
    
      ),
    );
  }
}

Widget _indicator(bool isActive )
{
  return AnimatedContainer(duration: Duration(milliseconds: 300),
  height: 10.0,
  width: isActive ? 20: 8,
  margin: EdgeInsets.only(right: 5.0),
  decoration: BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.circular(5)
  ) ,
  );
}

//Create the indicator list

