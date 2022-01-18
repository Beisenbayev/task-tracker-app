import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/hive/hive_init.dart';
import 'app/app.dart';

Future<void> main() async {
  //await deleteHiveData();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initHiveAdapters();
  await initHiveBoxes();

  runApp(const App());
}
