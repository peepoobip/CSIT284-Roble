import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    home:  GradientContainer(),
      
      ),
      
    
  );
}

class GradientContainer extends StatelessWidget{
  const GradientContainer({super.key});
  @override
   Widget build(context) {
   return Container(
       
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                Colors.greenAccent,
                Colors.lightGreenAccent
              ])
            ),

             child: Center(
            child: Text(
              'Hello World')
            ),
          ),
        );
   }
}