import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../text_for_websites/imprint_text.dart';

class ImprintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imprint")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: imprintContent,
        ),
      ),
    );
  }
}
