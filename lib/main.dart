import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:trilhaapp/models/registration_data.dart';
import 'package:trilhaapp/models/tasks_hive_model.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(RegistrationDataModelAdapter());
  Hive.registerAdapter(TasksHiveModelAdapter());
  runApp(const MyApp());
}
