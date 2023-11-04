import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(
    home: LotAnim(),
  ));
}

class LotAnim extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lottie"),),
      body: ListView(
        children: [
          Lottie.asset("assets/animation/butterflyyy.json"),
          Lottie.network("https://lottie.host/0bd97282-363c-4f92-b9ac-625f16760345/FeBMGD1VP7.json"),
        ],
      ),
    );
  }
}
