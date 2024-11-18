import 'package:flutter/material.dart';
import '../models/country.dart';
import 'country_form_page.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  List<Country> countries = [
    Country(
      code: 'ID',
      name: 'Indonesia',
      description: 'Negara kepulauan terbesar di dunia.',
      flagUrl: 'https://flagcdn.com/w320/id.png',
    ),
    Country(
      code: 'US',
      name: 'United States',
      description: 'Negara adi daya dunia.',
      flagUrl: 'https://flagcdn.com/w320/us.png',
    ),
  ];

  void _addOrEditCountry(Country? country, int? index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryFormPage(country: country),
      ),
    );
    if (result != null) {
      setState(() {
        if (index == null) {
          countries.add(result);
        } else {
          countries[index] = result;
        }
      });
    }
  }

  void _deleteCountry(int index) {
    setState(() {
      countries.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Negara')),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return Card(
            child: ListTile(
              leading: Image.network(country.flagUrl, width: 50, height: 50),
              title: Text(country.name),
              subtitle: Text(country.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _addOrEditCountry(country, index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteCountry(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrEditCountry(null, null),
        child: Icon(Icons.add),
      ),
    );
  }
}
