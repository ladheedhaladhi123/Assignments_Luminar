import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatefulPage extends StatefulWidget {
  final String name,location;
  int?phone;

  StatefulPage({super.key,this.phone,required this.location,required this.name});

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name,
            style: GoogleFonts.aboreto(fontSize: 45,color: Colors.orange,),),
            Text(widget.location,
            style: GoogleFonts.aboreto(fontSize: 35),),
            Text('${widget.phone}'),
          ],
        ),
      ),
    );
  }
}
