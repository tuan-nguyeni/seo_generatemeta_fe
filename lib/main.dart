import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seo_generatemeta_fe/widgets/home_screen.dart';
import 'package:seo_generatemeta_fe/widgets/imprint_screen.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());  // <-- Add this line
}



class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
       ],
      routes: {
        '/imprint': (context) => ImprintScreen(),
      },
    );
  }
}


