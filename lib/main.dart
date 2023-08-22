import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seo_generatemeta_fe/widgets/home_screen.dart';
import 'package:seo_generatemeta_fe/widgets/imprint_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/imprint': (context) => ImprintScreen(),
      },
    );
  }
}


