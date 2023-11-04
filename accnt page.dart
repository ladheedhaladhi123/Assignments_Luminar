import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: AccountPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
        ),
        Container(
          height: 100,
          color: Colors.red.shade900,
        ),
        Padding(padding: EdgeInsets.only(top: 7,bottom: 20),
        child: Row(
          children: [],
        ),)
      ],
    );
  }
}
