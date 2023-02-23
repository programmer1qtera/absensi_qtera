class UserModel {
  final String? id;
  final String? name;
  final String? email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
      );
}
