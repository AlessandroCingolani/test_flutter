import 'package:flutter/material.dart';
import 'package:test_flutter/screens/DettaglioPersonaggio.dart';
import 'package:test_flutter/screens/Home.dart';
import 'package:test_flutter/screens/ListaEpisodi.dart';
import 'package:test_flutter/screens/ListaPersonaggi.dart';
import 'package:test_flutter/screens/PaginaErrore.dart';

import 'models/Personaggio.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name){
      case '/home':
        if(args is String){
          return MaterialPageRoute(builder: (context) => const Home());
        }
        return _erroreRoute();

      case '/lista-personaggi':
        return MaterialPageRoute(builder: (context) => ListaPersonaggi());

      case '/lista-episodi':
        return MaterialPageRoute(builder: (context) => ListaEpisodi());

      case '/dettaglio-personaggio':
        if (settings.arguments is Personaggio) {
          final Personaggio personaggio = settings.arguments as Personaggio;
          return MaterialPageRoute(builder: (_) => DettaglioPersonaggio(personaggio: personaggio));
        }
        return _erroreRoute();
      default:
        return MaterialPageRoute(builder: (context) => PaginaErrore());
    }
  }

  // funzione privata per non ripetere sempre tutto il material route
  static Route<dynamic> _erroreRoute() {
    return MaterialPageRoute(builder: (_) => PaginaErrore());
  }
}
