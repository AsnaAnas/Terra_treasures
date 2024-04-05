import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFEF7EB),
      appBar: AppBar(
        backgroundColor: const Color(0xffFEF7EB),
        leading: 
        IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle,size: 50,)),
        title:  Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Text("Hi,Name",style: GoogleFonts.inder(),),
              Text("Welcome Back!",style: GoogleFonts.inder(color:Colors.grey,fontSize:16),),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined))
        ],

      ),
      body:  SafeArea(
        child: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 30,right: 30),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  //borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(17)

                ),
                
                fillColor: Colors.white,
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                hintStyle: const TextStyle(color: Colors.grey)
              )
            ),
          ),
        Container(
          color: Color(0xff436850),
        )
        ],
        
      ),
      
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Store'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               // Handle search functionality
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: () {
//               // Navigate to cart page
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Banner for promotions
//             Container(
//               height: 200,
//               child: Image.network(
//                 'https://placeimg.com/640/480/tech',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // Category list (horizontal scrolling)
//             Container(
//               height: 100,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Text(
//                       categories[index],
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Section for "Special Offers"
//             Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 'Special Offers',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             // Grid of popular products
//             Container(
//               child: GridView.count(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.7,
//                 children: List.generate(popularProducts.length, (index) {
//                   return ProductListItem(product: popularProducts[index]);
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Model class for product data (replace with your actual data structure)
// class Product {
//   final String name;
//   final String image;
//   final double price;

//   Product(this.name, this.image, this.price);
// }

// // Widget for displaying a product list item
// class ProductListItem extends StatelessWidget {
//   final Product product;

//   ProductListItem({required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Image.network(product.image, height: 100.0),
//             Text(product.name),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Sample data for categories and products (replace with your data)
// List<String> categories = ['Electronics', 'Fashion', 'Home'];
// List<Product> popularProducts = [
//   Product('Headphones', 'https://placeimg.com/640/480/tech', 99.99),
//   Product('Shirt', 'https://placeimg.com/640/480/fashion', 24.99),
//   Product('Coffee Maker', 'https://placeimg.com/640/480/tech', 49.99),
//   Product('Dress', 'https://placeimg.com/640/480/fashion', 39.99),
// ];