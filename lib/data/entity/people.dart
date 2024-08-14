
class People {
  String name;
  String id;
  String phone;
  People({required this.name, required this.id, required this.phone});
  

  factory People.fromJson(Map<dynamic , dynamic> json , String key){
    return People(name: json['name'] as String, id: key, phone: json['phone'] as String);
  }

}
