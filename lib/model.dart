class User {
  final int? id;
  final String name;
  final String phone;
  final String address;

  User(
      {this.id,
      required this.phone,
      required this.name,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        phone: json['phone'],
        name: json['name'],
        address: json['address']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phone': phone, 'address': address};
  }
}
