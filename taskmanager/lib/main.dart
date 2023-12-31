import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/core/utils/extensions/context_extension.dart';
import 'package:taskmanager/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

///[MyApp]
class MyApp extends StatelessWidget {
  ///initiliaze Myapp
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Tasks',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: context.colors.primary),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const TasksList(),
    );
  }
}
