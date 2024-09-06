class Episodio {
  final int id;
  final String name;
  final String air_date;
  final int episode;
  final int season;

  Episodio({required this.id,required this.name,required this.air_date,required this.episode,required this.season});


  factory Episodio.fromJson(Map<String,dynamic> json){
    return Episodio(id: json['id'],name: json['name'], air_date: json['air_date'],episode: json['episode'], season: json['season']);
  }
}