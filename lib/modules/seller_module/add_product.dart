import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:terra_treasures/modules/seller_module/seller_home.dart';
import 'package:terra_treasures/modules/user_module/screens/controller/produc_controller.dart';
import 'package:terra_treasures/util/constants.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? selectedImage;
  int tappedIndex = 0;
  

  final _pnameController = TextEditingController();
  final _prodetailController = TextEditingController();
  final _ecoController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandController = TextEditingController();
  final _materialController = TextEditingController();
  final _methodController = TextEditingController();

  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Kitchen",
      "image": "assets/kitchen.png"
    },
    {
      "title": "Fashion",
      "image": "assets/fashion.png"
    },
    {
      "title": "Home",
      "image": "assets/home.png"
    },
    {
      "title": "Other",
      "image": "assets/other.png"
    },
  ];

  List<Color> containerColors = [
    Colors.white,
    Colors.white,
    Colors.white,
  ];

 
    Future<void> _pickedImageGallery() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SellerHome()),
            );
          },
          icon: const Icon(Icons.arrow_circle_left_outlined),
        ),
        title: Text(
          "Product Details",
          style: GoogleFonts.inder(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 200),
               child: CircleAvatar(
                      radius: 50,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : const AssetImage("assets/product.png") as ImageProvider,
                      child: IconButton(
                        onPressed: _pickedImageGallery,
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
              // Container(
              //   height: 80,
              //   width: 80,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: Colors.black26),
              //     borderRadius: BorderRadius.circular(17),
              //   ),
              //   child: Positioned(
              //     child: IconButton(
              //         onPressed: () {
              //           showImagePickerOption(context);
              //         },
              //         icon: const Icon(Icons.camera_alt_outlined)),
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
              child: TextFormField(
                controller: _pnameController,
                decoration: InputDecoration(
                  hintText: "Product Name",
                  hintStyle: GoogleFonts.inder(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
              child: TextFormField(
                controller: _prodetailController,
                decoration: InputDecoration(
                  hintText: "Product Details",
                  hintStyle: GoogleFonts.inder(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 30, left: 30),
              child: TextFormField(
                controller: _ecoController,
                decoration: InputDecoration(
                  hintText: "How it becomes Eco friendly",
                  hintStyle: GoogleFonts.inder(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 40),
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  hintText: "Price (Rs)",
                  hintStyle: GoogleFonts.inder(color: Colors.black38),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 40),
              child: TextFormField(
                controller: _brandController,
                decoration: InputDecoration(
                  hintText: "Brand",
                  hintStyle: GoogleFonts.inder(color: Colors.black38),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 40),
              child: TextFormField(
                controller: _materialController,
                decoration: InputDecoration(
                  hintText: "Material",
                  hintStyle: GoogleFonts.inder(color: Colors.black38),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 40),
              child: TextFormField(
                controller: _methodController,
                decoration: InputDecoration(
                  hintText: "Method of production",
                  hintStyle: GoogleFonts.inder(color: Colors.black38),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductPage()),
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Add more products",
                      style: GoogleFonts.inder(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 220),
              child: SizedBox(
                height: 30,
                child: Text(
                  "Category",
                  style: GoogleFonts.inder(color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            3,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  tappedIndex = index;
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                color: tappedIndex == index
                                    ? Colors.grey
                                    : Colors.white,
                                child: Column(
                                  children: [
                                    Image.asset(
                                        "${gridMap.elementAt(index)['image']}"),
                                    Text(
                                        "${gridMap.elementAt(index)['title']}")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () async {
                      await addProduct();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AddProductDetails()),
                      // );
                    },
                    child: Text(
                      "CONTINUE ADD PRODUCT",
                      style: GoogleFonts.inder(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    final productController = ProductController();

    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:  Text("Please select an image.")),
      );
      return;
    }

    // Upload the image and get the URL
    final imageUrl = await productController.uploadImage(selectedImage!);

    // Ensure all fields are filled
    if (_pnameController.text.isEmpty ||
        _prodetailController.text.isEmpty ||
        _ecoController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _brandController.text.isEmpty ||
        _materialController.text.isEmpty ||
        _methodController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields.")),
      );
      return;
    }

   

    await productController.create(
      _pnameController.text,
      _prodetailController.text,
      _ecoController.text,
      imageUrl,
      gridMap[tappedIndex]['title'],
      double.parse(_priceController.text),
      _brandController.text,
      _materialController.text,
      _methodController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Details added successfully")),
    );
  }

  
    
  
}
 