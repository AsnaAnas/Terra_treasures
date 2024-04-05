// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// // class OnboardingScreen extends StatefulWidget {
// //   const OnboardingScreen({super.key});

// //   @override
// //   State<OnboardingScreen> createState() => _OnboardingScreenState();
// // }

// // class _OnboardingScreenState extends State<OnboardingScreen> {
// //   final _pageController = PageController();
// //   final _onboardingItems = [
// //     OnboardingInfo(
// //       image: "assets/recycle.png",
// //       description: "Respect the Earth, it sustains us all",
// //     ),
// //     OnboardingInfo(
// //       image: "assets/logo.png", // Update image path if needed
// //       description: "Respect the Earth, it sustains us all",
// //     ),
// //     OnboardingInfo(
// //       image: "assets/logo.png", // Update image path if needed
// //       description: "Welcome to the App!",
// //     ),
// //   ];

// //   bool _showOnboarding = true; // Flag to control onboarding display

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;
// //     return DefaultTabController(
// //       length: 2, // Number of tabs (dummy tabs for onboarding)
// //       child: Scaffold(
// //         backgroundColor: const Color(0xffFEF7EB),
// //         appBar: AppBar(
// //           title: !_showOnboarding
// //               ? const Text('App Name') // Replace with your app name
// //               : null, // Hide app bar during onboarding
// //         ),
// //         body: Stack(
// //           children: [
// //             // Onboarding content
// //             Visibility(
// //               visible: _showOnboarding,
// //               child: PageView.builder(
// //                 controller: _pageController,
// //                 itemCount: _onboardingItems.length,
// //                 itemBuilder: (context, index) {
// //                   return Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Image.asset(
// //                         _onboardingItems[index].image,
// //                         height: size.height * 0.25,
// //                       ),
// //                       const SizedBox(height: 15),
// //                       Text(
// //                         _onboardingItems[index].description,
// //                         style: GoogleFonts.inder(),
// //                       ),
// //                       const SizedBox(height: 30),
// //                       if (index == _onboardingItems.length - 1) ...[
// //                         // "Get Started" button for last screen
// //                         ElevatedButton(
// //                           onPressed: () {
// //                             setState(() {
// //                               _showOnboarding = false; // Hide onboarding
// //                             });
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             backgroundColor: const Color(0xff436850),
// //                             fixedSize: const Size(250, 40),
// //                           ),
// //                           child: Row(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Text(
// //                                 "Get Started",
// //                                 style: GoogleFonts.inder(color: Colors.white),
// //                               ),
// //                               const Icon(Icons.arrow_right_alt_sharp,
// //                                   color: Colors.white),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ],
// //                   );
// //                 },
// //               ),
// //             ),

// //             // Tab bar (dummy for onboarding)
// //             Positioned(
// //               bottom: 0.0,
// //               left: 0,
// //               right: 0,
// //               child: Visibility(
// //                 visible: _showOnboarding,
// //                 child: const TabBar(
// //                   tabs: [
// //                     Tab(icon: Icon(Icons.home)),
// //                     Tab(icon: Icon(Icons.settings)),
// //                   ],
// //                 ),
// //               ),
// //             ),

// //             // Smooth page indicator for progress
// //             Visibility(
// //               visible: _showOnboarding,
// //               child: Positioned(
// //                 bottom: 20.0, // Adjust position as needed
// //                 left: 0,
// //                 right: 0,
// //                 child: SmoothPageIndicator(
// //                   controller: _pageController,
// //                   count: _onboardingItems.length,
// //                   effect: const WormEffect(
// //                     activeDotColor: Color.fromARGB(255, 3, 102, 6),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class OnboardingInfo{
// //   final String image;
// //   final String  description;
// //   OnboardingInfo({required this.image,required this.description});

// // }

// import 'package:flutter/material.dart';
// // import 'package:kc0035a_flutter_customer_app/Screen1.dart';
// // import 'package:kc0035a_flutter_customer_app/data/SliderModel.dart';

// class HomeScreen extends StatefulWidget {
// @override
// _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

// List<SliderModel> slides = new List<SliderModel>();
// int currentIndex = 0;
// PageController _controller;

// @override
// void initState() {

// 	// TODO: implement initState
// 	super.initState();
// 	_controller = PageController(initialPage: 0);
// 	slides = getSlides();
// }
// @override
// void dispose(){
// 	_controller.dispose();
// 	super.dispose();
// }
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(
// 		title: Text("Geeks for Geeks"),
// 	),
// 	body: Column(
// 		children: [
// 		Expanded(
// 			child: PageView.builder(
// 				scrollDirection: Axis.horizontal,
// 				controller: _controller,
// 				onPageChanged: (value){
// 				setState(() {
// 					currentIndex = value;
// 				});
// 				},
// 				itemCount: slides.length,
// 				itemBuilder: (context, index){

// 				// contents of slider
// 				return Slider(
// 					image: slides[index].getImage(),
				
// 				);
// 				}
// 			),
// 		),
// 		Container(
// 			child: Row(
// 			mainAxisAlignment: MainAxisAlignment.center,
// 			children: List.generate(slides.length, (index) => buildDot(index, context),
// 			),
// 			),
// 		),
// 		Container(
// 			height: 60,
// 			margin: EdgeInsets.all(40),
// 			width: double.infinity,
// 			color: Colors.green,
// 			child: FlatButton(
// 			child: Text(
// 				currentIndex == slides.length - 1 ? "Continue": "Next"),
// 			onPressed: (){
// 				if(currentIndex == slides.length - 1){
// 				Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Screen1()),
// 				);
// 				}
// 				_controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
// 			},
// 			textColor: Colors.white,
// 			shape: RoundedRectangleBorder(
// 				borderRadius: BorderRadius.circular(25),
// 			),
// 			),

// 		),
// 		],
// 	),
// 	backgroundColor: Colors.white,
// 	);
// }

// // container created for dots
// Container buildDot(int index, BuildContext context){
// 	return Container(
// 	height: 10,
// 	width: currentIndex == index ? 25 : 10,
// 	margin: EdgeInsets.only(right: 5),
// 	decoration: BoxDecoration(
// 		borderRadius: BorderRadius.circular(20),
// 		color: Colors.green,
// 	),
// 	);
// }
// }

// // ignore: must_be_immutable
// // slider declared
// class Slider extends StatelessWidget {
// String image;

// Slider({this.image});

// @override
// Widget build(BuildContext context) {
// 	return Expanded(

// 	// contains container
// 	child: Container(
// 		child: Column(
// 		mainAxisAlignment: MainAxisAlignment.center,
// 		children: [

// 			// image given in slider
// 			Image(image: AssetImage(image)),
// 			SizedBox(height: 25),
// 		],
// 		),
// 	),
// 	);
// }
// }

// class SliderModel{
//   String image;
//   String title;
//   String description;
 
   
//   // Constructor for variables
//   SliderModel({this.title, this.description, this.image});
 
//   void setImage(String getImage){
//     image = getImage;
//   }
 
//   void setTitle(String getTitle){
//     title = getTitle;
//   }
//   void setDescription(String getDescription){
//     description = getDescription;
//   }
 
//   String getImage(){
//     return image;
//   }
 
//    String  getTitle(){
//     return title;
//    }
//    String getDescription(){
//     return description;
//    }
//   }
 
//   // List created
//   List<SliderModel> getSlides(){
//   List<SliderModel> slides = new List<SliderModel>();
//   SliderModel sliderModel = new SliderModel();
   
//    // Item 1
//    sliderModel.setImage("images/slider2.png");
//    sliderModel.setTitle("Copper Articles");
//    sliderModel.setDescription("Interested in buying Copper Handicrafts");
//    slides.add(sliderModel);
 
//    sliderModel = new SliderModel();
 
//   // Item 2
//   sliderModel.setImage("images/slider2.png");
//   sliderModel.setTitle("Copper Articles");
//   sliderModel.setDescription("Interested in buying Copper Handicrafts");
//   slides.add(sliderModel);
 
//   sliderModel = new SliderModel();
 
//   // Item 3
//   sliderModel.setImage("images/slider2.png");
//   sliderModel.setTitle("Copper Articles");
//   sliderModel.setDescription("Interested in buying Copper Handicrafts");
//   slides.add(sliderModel);
 
//   sliderModel = new SliderModel();
//   return slides;
// }