import 'package:flutter/widgets.dart';

class ResponsiveLayout {
 static bool isMobile(BuildContext context)=>
 MediaQuery.of(context).size.width<=600;

 static bool isTablet(BuildContext context)=>
 MediaQuery.of(context).size.width>600 && MediaQuery.of(context).size.width <=1000;
  

  static bool isDesktop(BuildContext context)=>
   MediaQuery.of(context).size.width>1000;

   static double screenWidth(BuildContext context)=>
   MediaQuery.of(context).size.width;

   static double screenHeight(BuildContext context)=>
   MediaQuery.of(context).size.height;
   
   
   
   }