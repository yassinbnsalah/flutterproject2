// ignore_for_file: file_names, unnecessary_this

class Projet {
  int? id;
  late String name;
  late String type;
  String? description;

  Projet({this.id, required this.name, required this.type, this.description});

  Projet.fromMap(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.type = obj['type'];
    this.description = obj['description'];
  }
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'type': type,
      'description': description,
    };
    return map;
  }

  @override
  String toString() {
    return name + " " + type + " :" + description!;
  }
}
