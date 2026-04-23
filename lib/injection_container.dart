import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final s1 = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  s1.registerLazySingleton(() => prefs);
}
