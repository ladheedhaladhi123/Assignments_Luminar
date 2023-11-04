import 'package:flutter/material.dart';

void main(){

  runApp( MaterialApp(home: RefrHome(),));
}

class RefrHome extends StatelessWidget {

  var name = ["Sky", "Stadium", "Unknown", "Dreamy", "mhdvjg"];
  var image = [
    "assets/images/sky.jpg",
    "assets/images/stadium.jpg",
    "assets/images/pxfuel.jpg",
    "assets/images/dreamy.jpg",
    "assets/images/bluerose.jpg",
  ];
  var price=[250,300,350,400,480];

   RefrHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View Using TRefractoring"),
      ),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
        return MyWidget(
            myimage: AssetImage(image [index]),
            name:name[index],
            price:'${price[index]})',
          );
        }
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  ImageProvider myimage;
  MyWidget({
    super.key,
    required this.myimage, required String name, required String price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Image.asset("assets/images/dreamy.jpg",height: 100,),
          Image(image: myimage),
          const Text("Dreamy Girl"),
          const Text("\$100"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.favorite), label: const Text("wishlist"),),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.shopping_cart), label: const Text("Buy Now"),)
            ],
          )
        ],
      ),
    );
  }
}
