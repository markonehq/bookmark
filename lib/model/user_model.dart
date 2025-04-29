class UserModel {
  String name;
  String avatar;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.avatar,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      email: json['email'] ?? '',
      uid: json['uid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
      'email': email,
      'uid': uid,
    };
  }
}
