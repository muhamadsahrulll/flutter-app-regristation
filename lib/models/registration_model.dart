class Registration {
  final String name;
  final String email;
  final String address;

  Registration({
    required this.name,
    required this.email,
    required this.address,
  });

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      name: json['name'],
      email: json['email'],
      address: json['address'],
    );
  }
}
