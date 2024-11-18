import 'package:flutter/material.dart';
import 'pages/country_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manajemen Negara',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CountryListPage(),
    );
  }
}
