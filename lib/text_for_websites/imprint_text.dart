import 'package:flutter/material.dart';

// Defining variables for easy modification
final String companyName = "Nguyen Industries GmbH";
final String executiveDirector = "Minh Tuan Nguyen";
final String address = "Franz-Werfel-Str. 5\n85055 Ingolstadt\nGermany";
final String email = "tuan.nguyen@datics-consulting.com";
final String shareholder = "Minh Tuan Nguyen";
final String registerInfo = "Ingolstadt HRB 9672";
final String taxId = "124/133/30708";
final String responsibleContent = "Minh Tuan Nguyen";
final String ecOdrLink = "https://ec.europa.eu/consumers/odr/";

final Widget imprintContent = RichText(
  text: TextSpan(
    style: TextStyle(color: Colors.black, fontSize: 16),
    children: <TextSpan>[
      TextSpan(text: "$companyName\n\n", style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: "Executive director:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$executiveDirector\n$address\n\n"),
      TextSpan(text: "E-Mail:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$email\n\n"),
      TextSpan(text: "Shareholder:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$shareholder\n\n"),
      TextSpan(text: "Register Court & Register Number:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$registerInfo\n\n"),
      TextSpan(text: "Sales tax identification number:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$taxId\n\n"),
      TextSpan(text: "Responsible for Content:\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$responsibleContent\n\n"),
      TextSpan(text: "European Commission Online Dispute Resolution\n\n", style: TextStyle(fontWeight: FontWeight.w500)),
      TextSpan(text: "$ecOdrLink\n\n", style: TextStyle(color: Colors.blue)),
      TextSpan(text: "We are not willing and obliged to participate in a dispute settlement procedure before a consumer arbitration board."),
    ],
  ),
);
