import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_application1/statemanagement_loading_provider/providerr/movieProvider.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var wishmovies= context.watch<MovieProvider>().movieWishList;

    return Scaffold(
      appBar: AppBar(
        title: Text('My WishList ${wishmovies.length}'),
      ),
      body: ListView.builder(
        itemCount: wishmovies.length,
          itemBuilder: (context, index){
          final wishMovie = wishmovies[index];
          return Card(
            child: ListTile(
              title: Text(wishMovie.title),
              subtitle: Text(wishMovie.time!),
              trailing: TextButton(onPressed: (){}, child: Text("Remove"),),
            ),
          );
          }),
    );
  }
}
