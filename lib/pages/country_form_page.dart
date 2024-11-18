import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryFormPage extends StatefulWidget {
  final Country? country;

  CountryFormPage({this.country});

  @override
  _CountryFormPageState createState() => _CountryFormPageState();
}

class _CountryFormPageState extends State<CountryFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _flagUrlController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.country?.code ?? '');
    _nameController = TextEditingController(text: widget.country?.name ?? '');
    _descriptionController = TextEditingController(text: widget.country?.description ?? '');
    _flagUrlController = TextEditingController(text: widget.country?.flagUrl ?? '');
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _flagUrlController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final country = Country(
        code: _codeController.text,
        name: _nameController.text,
        description: _descriptionController.text,
        flagUrl: _flagUrlController.text,
      );
      Navigator.pop(context, country);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.country == null ? 'Tambah Negara' : 'Edit Negara')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'Kode Negara'),
                validator: (value) => value!.isEmpty ? 'Harap isi kode negara' : null,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama Negara'),
                validator: (value) => value!.isEmpty ? 'Harap isi nama negara' : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) => value!.isEmpty ? 'Harap isi deskripsi' : null,
              ),
              TextFormField(
                controller: _flagUrlController,
                decoration: InputDecoration(labelText: 'URL Bendera'),
                validator: (value) => value!.isEmpty ? 'Harap isi URL bendera' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
