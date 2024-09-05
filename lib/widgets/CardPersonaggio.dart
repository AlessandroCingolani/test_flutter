import 'package:flutter/material.dart';
import '../models/Personaggio.dart';

class CardPersonaggio extends StatelessWidget {
  final Personaggio personaggio;  // Passi l'oggetto dinamico qui

  const CardPersonaggio({super.key,required this.personaggio})  ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/dettaglio-personaggio',
              arguments: personaggio,
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
                      tag: 'hero-tag-${personaggio.id}',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(personaggio.image),
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
                        personaggio.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Status: ${personaggio.status}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Species: ${personaggio.species}',
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
        ),
      ),
    );
  }
}