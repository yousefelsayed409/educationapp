import 'package:educationapp/auth/data/model/user_model.dart';
import 'package:educationapp/core/util/app_const.dart';
import 'package:hive/hive.dart';

abstract class GetUserFromLockel {
  static UserModel? userModel;
  static final _box = Hive.box<UserModel>(AppConst.userBox);
  static void add({required UserModel usermodel}) {
    _box.put(AppConst.userBox, usermodel);
  }

  static void init() {
    try {
      userModel = _box.get(AppConst.userBox);
      // print(userModel?.email);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  static void remove() {
    print(' i a mion ');
    try {
      _box.clear();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
