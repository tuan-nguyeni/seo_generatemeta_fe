
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';

// Remember to create a constants.dart and import it here.

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keywordController = TextEditingController();
  final urlController = TextEditingController();
  final languageController = TextEditingController();
  final excludedWordsController = TextEditingController();

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  String title = "";
  String description = "";
  bool isLoading = false;

  void generateMeta() async {
    setState(() {
      isLoading = true;
    });
    // Logging event when user initiates meta generation
    analytics.logEvent(name: 'generate_meta_attempt', parameters: null);

    try {
      final response = await http.post(
        //Uri.parse('http://localhost:5002/generate-meta'),
        Uri.parse('https://seo-generatemeta-be-bc08e0e40826.herokuapp.com/generate-meta'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'keyword': keywordController.text,
          'url': urlController.text,
          'language': languageController.text,
          'excluded_words': excludedWordsController.text,
        }),

      );

      final data = json.decode(response.body);

      if (data.containsKey('error')) {
        if (data.containsKey('message'))
          showErrorDialog(data['error'] + "\n\n **** \n\n"
              "Technical Details:\n\n"
              + data['message']);
        else
          showErrorDialog(data['error']);
      } else {
        // After successful meta generation
        analytics.logEvent(name: 'meta_generation_success', parameters: {
          'keyword': keywordController.text,
          'url': urlController.text,
          'language': languageController.text,
        });
        setState(() {
          title = data['title'];
          description = data['description'];
          isLoading = false;
        });
      }
    } catch (e) {
      showErrorDialog("Failed to connect to the server.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showErrorDialog(String message) {
    analytics.logEvent(name: 'meta_generation_failed', parameters: {
      'keyword': keywordController.text,
      'url': urlController.text,
      'language': languageController.text,
      'error message': message
    });

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              analytics.logEvent(name: 'imprint_attempt', parameters: null);
              Navigator.pushNamed(context, '/imprint');
              },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              AppStrings.descriptionInfo,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: keywordController,
                      decoration: InputDecoration(labelText: 'Keyword', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: urlController,
                      decoration: InputDecoration(labelText: 'URL', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: languageController,
                      decoration: InputDecoration(labelText: 'Language', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: excludedWordsController,
                      decoration: InputDecoration(labelText: 'Exclude these words in the generated result', border: OutlineInputBorder()),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: generateMeta,
              child: Text('Generate'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              AppStrings.generatedTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            SelectableText(title),
            SizedBox(height: 10),
            Text(
              AppStrings.generatedDescription,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 5),
            SelectableText(description),
          ],
        ),
      ),
    );
  }
}