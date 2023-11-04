import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GridCustom(),
  ));
}

class GridCustom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView.Custom"),
      ),
      body: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          childrenDelegate: SliverChildListDelegate(
              List.generate(12, (index) =>
                  Card(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage(
                                    "assets/images/bluerose.jpg"))
                            ),
                          ),
                          const Text(
                            "item 1", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ))
          )),

    );
  }
}
