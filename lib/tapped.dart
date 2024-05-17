import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tappedIndex=0; // To store the index of the tapped container

   final List<Map<String,dynamic>> gridMap=[
      {
        "title": "Kitchen",
        "image":"assets/kitchen.png"
      },
       {
        "title": "fashion",
        "image":"assets/fashion.png"
      },
       {
        "title": "Home",
        "image":"assets/home.png"
      },
       {
        "title": "Kitchen",
        "image":"assets/kitchen.png"
      },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tap Containers'),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.only(top: 100,),
          child: Column(
            children: [
                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (index) => GestureDetector(
                onTap: () {
                  // Set the tappedIndex to the index of the tapped container
                  setState(() {
                    tappedIndex = index;
                    
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: tappedIndex == index ? Colors.grey : Colors.white,
                  child: Column(
                    children: [
                      Image.asset("${gridMap.elementAt(index)['image']}"),
                      Text("${gridMap.elementAt(index)['title']}")
                    ],
                  ),
                ),
              ),
            ),
          ),
            ],
          ),
        )
       
      ),
    );
  }
}