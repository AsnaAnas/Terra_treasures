

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:terra_treasures/modules/auth_screens/email_verify.dart';
// import 'package:terra_treasures/util/custom_button.dart';
// import 'package:terra_treasures/util/textfield.dart';

// class ForgotPsd extends StatelessWidget {
//    ForgotPsd({super.key});
//   final emailcontroller=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Stack(
//          children: [
//            Container(
           
//         height: double.infinity,
//         width: double.infinity,
//         decoration:  BoxDecoration(
//            color: Colors.black,
//           image: DecorationImage(image: const AssetImage("assets/login.jpg"),
//           fit: BoxFit.fill,
//           colorFilter: ColorFilter.mode(
//           Colors.black.withOpacity(0.8),
//           BlendMode.dstATop,
//         ),
//           )
//         ),
        
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 150,left: 80,right:50),
//         child: Text("Forget Password",style: GoogleFonts.inder(
//           fontSize:24,fontWeight:FontWeight.bold,color:Colors.white)
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 300,left: 50,),
//         child: Column(
//           children: [
//             MyTextfield(
//               controller: emailcontroller, 
//               hintText: "Enter your email", 
//               obscureText: false),

//               const SizedBox(height: 50,),
//               CustomButton(onPressed: (){
//                 Navigator.push(context,MaterialPageRoute(builder: (context) =>  VerifyEmailPage()) );
//               }, text: "Send")
//           ],
//         ),
//       )
//          ]
  
//     )
           
         
//       );

  
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPsd extends StatefulWidget {
  const ForgotPsd({Key? key}) : super(key: key);

  @override
  State<ForgotPsd> createState() => _ForgotState();
}

class _ForgotState extends State<ForgotPsd> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email has been sent')),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user found for that email')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.inder(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Enter your email address to reset your password',
                    style: GoogleFonts.inder(),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Type your email',
                        labelStyle: GoogleFonts.inder(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(220, 199, 192, 192),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        resetPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Send',
                      style: GoogleFonts.inder(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}