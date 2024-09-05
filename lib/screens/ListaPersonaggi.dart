import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:test_flutter/models/Personaggio.dart';
import 'package:test_flutter/widgets/CustomeDrawerHeader.dart';
import 'package:test_flutter/widgets/Header.dart';

Future<List<Personaggio>> fetchPersonaggi()async {
  List<Personaggio> personaggi = [];
  var response = await http.get(Uri.parse('https://api.sampleapis.com/rickandmorty/characters'));

  var body = json.decode(response.body);


  for(var i = 0;i < body.length;i++){
    personaggi.add(Personaggio.fromJson(body[i]));
  }

  return personaggi;
}

class ListaPersonaggi extends StatefulWidget {

  @override
  State<ListaPersonaggi> createState() => _ListaPersonaggiState();
}
class _ListaPersonaggiState extends State<ListaPersonaggi> {

  late Future<List<Personaggio>> personaggi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    personaggi = fetchPersonaggi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Lista personaggi'),
      drawer: CustomeDrawerHeader(),
      body: FutureBuilder<List<Personaggio>>(
        future: personaggi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Caricamento dei dati
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Se restituisce un errore manda il messaggio in pagina
            return Center(child: Text('Errore: ${snapshot.error}'));
            // Se arrivano dati fa vedere in pagina la lista
          } else if (snapshot.hasData) {
            // builder per la direzione
            return OrientationBuilder(
              // si aspetta il contentuto e la direzione
              builder: (BuildContext context,Orientation orientation) {
                return GridView.builder(
                  // snapshot dato che arriva dal future builder
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/dettaglio-personaggio',
                                arguments: snapshot.data![index],
                              );
                            },
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                              ),
                              margin: const EdgeInsets.all(20),
                              clipBehavior: Clip.hardEdge,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Hero(
                                        tag: 'hero-tag-${snapshot.data![index].id}', // Tag univoco per ogni personaggio
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(snapshot.data![index].image),
                                          radius: 40.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Status: ${snapshot.data![index].status}',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text(
                                          'Species: ${snapshot.data![index].species}',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )

                      ),
                    );
                  },
                  // se lo schermo è in verticale o orizzontale prende 1 o 2 colonne
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
                      // dimensione figli
                      childAspectRatio: 3
                  ),
                );
              }
            );
          } else {
            // Se non c è nessun dato
            return const Center(child: Text('Nessun dato disponibile'));
          }
        },
      ),
    );

  }
}
