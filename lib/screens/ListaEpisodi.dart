import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/Episodio.dart';
import '../widgets/CustomeDrawerHeader.dart';
import '../widgets/Header.dart';

Future<List<Episodio>> fetchEpisodi() async {
  List<Episodio> episodi = [];
  
  var response = await http.get(Uri.parse('https://api.sampleapis.com/rickandmorty/episodes'));

  var body = json.decode(response.body);

  for(var i = 0; i < body.length;i++){
    episodi.add(Episodio.fromJson(body[i]));
  }
  print(body);
  return episodi;

}


class ListaEpisodi extends StatefulWidget {
  const ListaEpisodi({super.key});

  @override
  State<ListaEpisodi> createState() => _ListaEpisodiState();
}


class _ListaEpisodiState extends State<ListaEpisodi> {
  late Future<List<Episodio>> episodi;

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    episodi = fetchEpisodi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Lista episodi'),
      drawer: CustomeDrawerHeader(),
      body: FutureBuilder<List<Episodio>>(
        future: episodi,
        // snapshot contiene informazioni sullo stato corrente dell'operazione asincrona
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Caricamento dei dati se ancora non ha finito di ricevere
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Se restituisce un errore manda il messaggio in pagina
            return Center(child: Text('Errore: ${snapshot.error}'));
            // Se arrivano dati fa vedere in pagina la lista
          } else if (snapshot.hasData) {
            // builder per la direzione
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // episodio per non ripetere ogni volta snapshot.data![index]
                var episodio = snapshot.data![index];

                // Puoi personalizzare qui il layout di ogni elemento della lista
                return ListTile(
                  title: Text(episodio.name), // Titolo dell'episodio
                  subtitle: Text('Data: ${episodio.air_date}'), // Data di rilascio
                  trailing: Text('Stagione: ${episodio.season}, Episodio: ${episodio.episode}'),
                );
              },
            );
          } else {
            return const Center(child: Text('Nessun dato disponibile'));
          }
        },
      ),
    );
  }
}
