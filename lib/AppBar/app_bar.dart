  import 'package:flutter/material.dart';

  void main(){
    runApp(CustomeAppBar());
  }

  class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
    const CustomeAppBar({super.key});

    @override
    // TODO: implement key
  Size get preferredSize=>Size.fromHeight(kToolbarHeight);

    @override
    Widget build(BuildContext context) {
      return
        AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,//Prevents Flutter from automatically showing a back button (useful if this is your main screen).
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/cdaclogo.png",height: 30,),
                      Text("Pnuemonia Detection APP"),
                      Image.asset("assets/images/cdaclogo.png",height: 30),
                    ],
                  ),
                ),
              ),
            ),
        );
    }}
    
  

    