class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.species,
    required this.status,
    required this.type,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      image: json['image'],
      species: json['species'],
      status: json['status'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'name': name,
      'gender': gender,
      'image': image,
      'species': species,
      'status': status,
      'type': type,
    };
  }
}
