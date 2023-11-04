import 'package:flutter/material.dart';
import 'package:project_application1/statemanagement_loading_provider/providerr/movieProvider.dart';
import 'package:project_application1/statemanagement_loading_provider/screens/wishlist.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (BuildContext context)=> MovieProvider(),
  child:  MaterialApp(
    home: MovieMain(),
  ),));
}

class MovieMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var wishmovies= context.watch<MovieProvider>().movieWishList;
    var movies = context.watch<MovieProvider>().movies;

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Column(
        children: [
         ElevatedButton.icon(
             onPressed: ()=>Navigator.of(context).push(
                 MaterialPageRoute(
                     builder: (context) => WishListScreen())),
             icon: Icon(Icons.favorite_border),
             label: Text("Goto WishList ${wishmovies.length}")),
          Expanded(
              child: ListView.builder(
                itemCount: movies.length,
              itemBuilder: (context, index){
                //movies are list<map> here current movie is now a map
                final currentMovie = movies[index];
            return Card(
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.time!),
                trailing: IconButton(
                    icon: Icon(Icons.favorite,
                    color: wishmovies.contains(currentMovie)
                        ? Colors.red : Colors.black26),
                    onPressed: (){
                  if(!wishmovies.contains(currentMovie)){
                    context
                        .read<MovieProvider>()
                        .addtoWishList(currentMovie);
                  }else{
                    context
                        .read<MovieProvider>()
                        .removeFromWishList(currentMovie);
                  }

                },
                   ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
