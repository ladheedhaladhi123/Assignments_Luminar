import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView2(),
    debugShowCheckedModeBanner: false ,
  ));
}

class ListView2 extends StatelessWidget {
  var name = ["Sky", "Stadium", "Unknown", "Dreamy", "mhdvjg"];
  var image = [
    "assets/images/sky.jpg",
    "assets/images/stadium.jpg",
    "assets/images/pxfuel.jpg",
    "assets/images/dreamy.jpg",
    "assets/images/bluerose.jpg",
  ];
  var subtitle = ["jhmf","jhfm","tyfku","hfjgf","htfh"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("ListView 2"),
        actions: [
          const Icon(Icons.camera_alt),
          const SizedBox(width: 20,),
          const Icon(Icons.search),
          const SizedBox(width: 20,),
          PopupMenuButton(itemBuilder: (context){
          return  [
            const PopupMenuItem(child: Text("Settings")),
            const PopupMenuItem(child: Text("Profile")),
            const PopupMenuItem(child: Text("BroadCast")),
            const PopupMenuItem(child: Text("Help")),
            ];
          })
        ],
      ),
      body: ListView(
        children: List.generate(
            5,
            (index) => Card(
                  child: ListTile(
                    title: Text(name[index]),
                    subtitle: Text(subtitle[index]),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(image[index]),
                    ),
                    trailing: const Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text("12:20"),
                       CircleAvatar(
                         minRadius: 4,
                         maxRadius: 10,
                         backgroundColor: Colors.green,
                         child: Text("1"),
                       )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
