import 'package:educationapp/auth/data/repo/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
// Alternatively you could write it if you don't like global variables
  GetIt.I.registerSingleton<HomeRepoAuthImple>(const HomeRepoAuthImple());
}
