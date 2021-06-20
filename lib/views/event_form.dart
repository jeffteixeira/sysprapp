import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sysprapp/models/event.dart';
import 'package:sysprapp/provider/events.dart';

class EventForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Event event) {
    if (event != null) {
      _formData['id'] = event.id;
      _formData['name'] = event.name;
      _formData['date'] = event.id;
      _formData['spending'] = event.id;
      _formData['donations'] = event.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final Event event = ModalRoute().of(context).settings.arguments;
    //_loadFormData(event);

    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário Eventos"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                /*Provider.of<Events>(context, listen: false).put(
                  Event(
                    id: _formData['id'],
                    name: _formData['name'],
                    date: _formData['date'],
                    spending: _formData['spending'],
                    donations: _formData['donations'],
                  ),
                );*/
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Incorreto';
                  }
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['date'],
                decoration: InputDecoration(labelText: 'Data'),
                onSaved: (value) => _formData['date'] = value!,
              ),
              TextFormField(
                initialValue: _formData['spending'],
                decoration: InputDecoration(labelText: 'Despesa'),
                onSaved: (value) => _formData['spending'] = value!,
              ),
              TextFormField(
                initialValue: _formData['donations'],
                decoration: InputDecoration(labelText: 'Doações'),
                onSaved: (value) => _formData['donations'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
