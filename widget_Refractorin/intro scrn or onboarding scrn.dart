import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project_application1/stfl login with validation.dart';
import 'package:project_application1/splash2.dart';

void main(){
  runApp(const MaterialApp(home: IntroScrn(),));
}

class IntroScrn extends StatelessWidget {
  const IntroScrn({super.key});

  @override
  Widget build(BuildContext context) {
     PageDecoration pageDecoration= PageDecoration(
       titleTextStyle: TextStyle(
         fontWeight: FontWeight.w900,fontSize: 40,color: Colors.red,
       ),
       bodyTextStyle: GoogleFonts.aBeeZee(
         fontStyle: FontStyle.italic,fontSize: 20,color: Colors.black
       ),
       boxDecoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Colors.deepPurple,
             Colors.purple,
             Colors.white,
             Colors.pinkAccent,
             Colors.pink,
           ]
         )
       )
     );
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: pageDecoration,
          title: 'First Page',
          body: "Introduction screen shows the details of the app and demo of pages",
          image: IntroImage("https://images.unsplash.com/photo-1500576992153-0271099def59?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80"),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: 'Second Page',
          body: "Introduction screen shows the details of the app and demo of pages",
          image: IntroImage("https://images.unsplash.com/photo-1580893246395-52aead8960dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
        ),
        PageViewModel(
          decoration: pageDecoration,
          title: 'Third Page',
          body: "Introduction screen shows the details of the app and demo of pages",
          image: IntroImage("https://images.unsplash.com/photo-1508777934-43aa1635c0dc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=462&q=80"),
        )
      ],
      onDone: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Splash2())),
      onSkip: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Login2())),
      showSkipButton: true,
    skip: const Text("Skip"),
    next: const Icon(Icons.arrow_forward_ios_rounded),
    done: const Text("Done"),
    dotsDecorator: const DotsDecorator(
    size: Size(10,12),
    color: Colors.lightBlue,
    activeSize: Size(25, 12),
    activeColor: Colors.lime,
    activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20),
    )
    ),
    )
    );
  }

 Widget IntroImage(String image) { //custom widget
   return Container(
       height: 500,
       width: double.infinity,
       decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(image),))
   );
    // return Container(
    //     height:700,
    //     width:double.infinity,
    //     decoration:BoxDecoration(
    //       image: DecorationImage(
    //         image:NetworkImage(image,))
    // );
 }
}
