import 'package:flutter/material.dart';

import '../widgets/CustomeDrawerHeader.dart';
import '../widgets/Header.dart';



class PaginaErrore extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const Header(title: 'Errore'),
      drawer:   CustomeDrawerHeader(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pagina non trovata',
              ),
            ],
          ),
        ),
      ),
    );

  }
}

