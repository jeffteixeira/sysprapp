import 'package:flutter/material.dart';
import 'package:sysprapp/models/event.dart';
import 'package:sysprapp/provider/events.dart';
import 'package:provider/provider.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Event event) {
    if (event != null) {
      _formData['id'] = event.id;
      _formData['name'] = event.name;
      _formData['date'] = event.date;
      _formData['spending'] = event.spending;
      _formData['donation'] = event.donation;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Event event = ModalRoute.of(context).settings.arguments;
    _loadFormData(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Eventos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();

                Provider.of<Events>(context, listen: false).put(
                  Event(
                    id: _formData['id'],
                    name: _formData['name'],
                    date: _formData['date'],
                    spending: _formData['spending'],
                    donation: _formData['donation'],
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome do Evento'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras.';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['date'],
                decoration: InputDecoration(labelText: 'Data'),
                onSaved: (value) => _formData['date'] = value,
              ),
              TextFormField(
                initialValue: _formData['spending'],
                decoration: InputDecoration(labelText: 'Despesas'),
                onSaved: (value) => _formData['spending'] = value,
              ),
              TextFormField(
                initialValue: _formData['donation'],
                decoration: InputDecoration(labelText: 'Doações'),
                onSaved: (value) => _formData['donation'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
