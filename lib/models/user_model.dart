class UserModel {
  final String name;
  final int age;
  final String profile;
  final int mutualCount;

  UserModel({required this.name, required this.age, required this.profile, required this.mutualCount});
}

final UserModel user = UserModel(
  name: "Angelina",
  age: 28,
  profile: "assets/images/user.png",
  mutualCount: 103,
);
