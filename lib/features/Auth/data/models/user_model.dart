class UserModel {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String level;
  final int experienceYears;

  const UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.level,
    required this.experienceYears,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['displayName'],
      phone: json['username'],
      address: json['address'],
      level: json['level'],
      experienceYears: json['experienceYears'],
    );
  }
}
