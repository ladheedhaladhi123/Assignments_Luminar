import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:project_application1/statemanagement_loading_provider/model/movies.dart';

final List<Movies> movieList = List.generate(100,
        (index) => Movies(title: 'Movies $index',
            time: '${Random().nextInt(100) + 60} minutes'));
class MovieProvider extends ChangeNotifier{

  final List<Movies> _movie = movieList;
  List<Movies> get movies => _movie;

  final List<Movies> _wishListMovie = [];
  List<Movies> get movieWishList => _wishListMovie;

  void addtoWishList(Movies movieFromMainPage) {
    _wishListMovie.add(movieFromMainPage);
    notifyListeners();
  }
  void removeFromWishList(Movies removedMovie){
    _wishListMovie.remove(removedMovie);
    notifyListeners();
  }


}