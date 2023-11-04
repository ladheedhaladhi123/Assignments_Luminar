import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Instaa(),
  ));
}

class Instaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepPurple,
                        Colors.pink,
                        Colors.orange,
                        Colors.yellow,
                      ],
                    ).createShader(bounds),
                child: const FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 100,
                )),
            const SizedBox(
              height: 200,
            ),
            const Text(
              "From",
              style: TextStyle(color: Colors.pink),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Meta",
              style: TextStyle(color: Colors.deepPurple,


              ),
            )
          ],
        ),
      ),
    );
  }
}
