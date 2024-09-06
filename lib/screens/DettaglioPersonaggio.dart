import 'package:flutter/material.dart';
import 'package:test_flutter/models/Personaggio.dart';
import 'package:test_flutter/widgets/CustomeDrawerHeader.dart';
import 'package:test_flutter/widgets/Header.dart';

class DettaglioPersonaggio extends StatelessWidget {
  final Personaggio personaggio;

  const DettaglioPersonaggio({super.key, required this.personaggio});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const Header(title: 'Dettagli Personaggio'),
      drawer: CustomeDrawerHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                personaggio.name,
                style: TextStyle(
                  fontSize: size > 600 ? 40 : 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14.0),
              Hero(
                tag: 'hero-tag-${personaggio.id}',
                child: Image.network(
                  personaggio.image,
                  fit: BoxFit.fill,
                  height: size > 600 ? 600 : 300,
                  width: size > 600 ? 600 : 300,

                ),
              ),
              const SizedBox(height: 20.0),
              // Usa un Container per specificare le dimensioni della Card
              Container(
                width: double.infinity, // Usa la larghezza completa disponibile
                constraints: const BoxConstraints(
                  maxWidth: 600, // Imposta la larghezza massima della Card
                ),
                child: Card(
                  elevation: 40,
                  shadowColor: Theme.of(context).colorScheme.inversePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(20),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status: ${personaggio.status}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Specie: ${personaggio.species}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Tipo: ${personaggio.type}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Genere: ${personaggio.gender}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Origini: ${personaggio.origin}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}