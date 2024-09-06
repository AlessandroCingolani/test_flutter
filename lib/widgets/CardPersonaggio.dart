import 'package:flutter/material.dart';
import '../models/Personaggio.dart';

class CardPersonaggio extends StatefulWidget {
  final Personaggio personaggio; // Passi l'oggetto dinamico qui

  const CardPersonaggio({super.key, required this.personaggio});

  @override
  State<CardPersonaggio> createState() => _CardPersonaggioState();
}

class _CardPersonaggioState extends State<CardPersonaggio> {
  bool isFavourite = false;

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
              arguments: widget.personaggio,
            );
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(20),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'hero-tag-${widget.personaggio.id}',
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(widget.personaggio.image),
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
                            widget.personaggio.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Status: ${widget.personaggio.status}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'Species: ${widget.personaggio.species}',
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
                Positioned(
                  bottom: 30,
                  right: 10.0,
                  child: IconButton(
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_outline,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite; // Cambia lo stato quando cliccato
                      });
                    },
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

