class User {
  int? id;
  String? name;
  String? email;
  String? password;

  User({this.id, required this.name, required this.email, required this.password});

  // Método para convertir el objeto User a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  // Método estático para construir un objeto User desde un mapa
  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}
