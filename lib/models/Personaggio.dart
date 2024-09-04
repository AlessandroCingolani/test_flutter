class Personaggio {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final String image;

  Personaggio({required this.id,required this.name,required this.status,required this.species,required this.type,required this.gender,required this.origin,required this.image});


  factory Personaggio.fromJson(Map<String,dynamic> json){
    return Personaggio(id: json['id'],name: json['name'], status: json['status'],species: json['species'], type: json['type'], gender: json['gender'], origin: json['origin'], image: json['image']);
  }
}