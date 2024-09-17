import 'package:educationapp/auth/data/model/user_model.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      id: reader.readInt(),
      userName: reader.readString(),
      email: reader.readString(),
      nationlId: reader.readString(),
      token: reader.readString(),
    );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.userName);
    writer.writeString(obj.email);
    writer.writeString(obj.nationlId);
    writer.writeString(obj.token);
  }
}
