class UserModel {
  String? name;
  String? userImage;
  String? email;
  String? uid;

  UserModel({
    required this.name,
    required this.userImage,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'],
        userImage: map['userImage'],
        email: map['email'],
        uid: map['map']);
  }
}
