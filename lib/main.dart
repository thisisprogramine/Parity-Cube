import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:parity_cube/src/presentation/parity_cube_app.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'src/injector.dart' as getIt;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]));

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await getIt.init();

  runApp(const ParityCubeApp());
}
