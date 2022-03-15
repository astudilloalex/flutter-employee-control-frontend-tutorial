class Role {
  const Role({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(id: json['id'] as int, name: json['name'] as String);
  }
}
