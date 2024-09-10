import 'package:flutter/material.dart';

class Like with ChangeNotifier {
  // variabile privata
  List<int> _like = [];

  List<int> get like => _like;

  // funzione se non trova id lo aggiunge alla lista senno aggiunge id
  void addRemoveLike({required int id}){
    if(like.contains(id)){
      _like.remove(id);
    }else{
      _like.add(id);
    }
    notifyListeners();
  }
}