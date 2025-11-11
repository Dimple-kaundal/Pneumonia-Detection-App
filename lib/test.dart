// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: SignUpPage(),
//   ));
// }

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Color lightPurple = const Color(0xFFE4E5F9);
//     final Color buttonColor = const Color(0xFF6C77F4);

//     return Scaffold(
//       backgroundColor: const Color(0xFFBFC1D9),
//       body: Center(
//         child: Container(
//           width: 900,
//           height: 500,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//                 offset: const Offset(0, 5),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // Left section
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: lightPurple,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       bottomLeft: Radius.circular(20),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(40),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.local_hospital,
//                             color: Colors.blueAccent,
//                             size: 30,
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Text(
//                           'We at MediCare are\nalways fully focused on\nhelping your child.',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             color: Colors.black87,
//                             height: 1.5,
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Image.asset(
//                           'assets/stethoscope.png',
//                           height: 150,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               // Right section
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "English (US)",
//                           style: GoogleFonts.poppins(
//                             fontSize: 13,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Center(
//                         child: Text(
//                           "Create Account",
//                           style: GoogleFonts.poppins(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           OutlinedButton.icon(
//                             onPressed: () {},
//                             icon: Image.asset('assets/google.png', height: 20),
//                             label: const Text('Sign up with Google'),
//                           ),
//                           const SizedBox(width: 15),
//                           OutlinedButton.icon(
//                             onPressed: () {},
//                             icon:
//                                 Image.asset('assets/facebook.png', height: 20),
//                             label: const Text('Sign up with Facebook'),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: const [
//                           Expanded(child: Divider(thickness: 1)),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             child: Text("OR"),
//                           ),
//                           Expanded(child: Divider(thickness: 1)),
//                         ],
//                       ),
//                       const SizedBox(height: 25),
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: "Full Name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: "Email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           suffixIcon: const Icon(Icons.visibility_off),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: buttonColor,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Create Account",
//                             style: GoogleFonts.poppins(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Center(
//                         child: TextButton(
//                           onPressed: () {},
//                           child: const Text("Already have an account? Log in"),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
