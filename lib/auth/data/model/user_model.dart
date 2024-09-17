import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String nationlId;

  @HiveField(4)
  final String token;

  UserModel(
      {required this.id,
      required this.userName,
      required this.email,
      required this.nationlId,
      // required this.typeRigister,
      required this.token});
  factory UserModel.fromJson({required Map<String, dynamic> json}) => UserModel(
        id: json['id'] as int,
        userName: json['username'] as String,
        email: json['email'] as String,
        nationlId: json['national_id'] as String,
        // typeRigister: json['type_register'] ,
        token: json['token'] as String,
      );
}
