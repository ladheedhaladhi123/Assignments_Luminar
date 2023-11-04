import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(MaterialApp(
    home: Grid_Stag(),
  ));
}

class Grid_Stag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered GridView"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 1, //width
                mainAxisCellCount: 1, //height
                child: Container(
                  color: Colors.yellow,
                  child: const Center(
                    child: Icon(Icons.cabin),
                  ),
            )),

            StaggeredGridTile.count(
                crossAxisCellCount: 1, //width
                mainAxisCellCount: 2, //height
                child: Container(
                  color: Colors.indigo,
                  child: const Center(
                    child: Icon(Icons.cabin),
                  ),
                )),

            StaggeredGridTile.count(
                crossAxisCellCount: 1, //width
                mainAxisCellCount: 1, //height
                child: Container(
                  color: Colors.pinkAccent,
                  child: const Center(
                    child: Icon(Icons.cabin),
                  ),
                )),

            StaggeredGridTile.count(
                crossAxisCellCount: 1, //width
                mainAxisCellCount: 1, //height
                child: Container(
                  color: Colors.deepPurple,
                  child: const Center(
                    child: Icon(Icons.add_alarm),
                  ),
                )),

            StaggeredGridTile.count(
                crossAxisCellCount: 1, //width
                mainAxisCellCount: 1, //height
                child: Container(
                  color: Colors.green,
                  child: const Center(
                    child: Icon(Icons.phone),
                  ),
                )),

            StaggeredGridTile.count(
                crossAxisCellCount: 2, //width
                mainAxisCellCount: 1, //height
                child: Container(
                  color: Colors.deepOrange,
                  child: const Center(
                    child: Icon(Icons.home),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
