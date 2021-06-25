import 'package:flutter/material.dart';
import 'package:flutter_crud/models/event.dart';
import 'package:flutter_crud/provider/events.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  DateTime _dateTime;
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Event event) {
    if (event != null) {
      _formData['id'] = event.id;
      _formData['name'] = event.name;
      _formData['startDate'] = event.startDate;
      _formData['endDate'] = event.endDate;
      _formData['spending'] = event.spending;
      _formData['donation'] = event.donation;
      _formData['volunteers'] = event.volunteers;
      _formData['details'] = event.details;
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
                    startDate: _formData['startDate'],
                    endDate: _formData['endDate'],
                    spending: _formData['spending'],
                    donation: _formData['donation'],
                    volunteers: _formData['volunteers'],
                    details: _formData['details'],
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
                initialValue: _formData['startDate'],
                decoration: InputDecoration(labelText: 'Data de Início'),
                onSaved: (value) => _formData['startDate'] = value,
              ),
              TextFormField(
                initialValue: _formData['endDate'],
                decoration: InputDecoration(labelText: 'Data de Termino'),
                onSaved: (value) => _formData['endDate'] = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                initialValue: _formData['spending'],
                decoration: InputDecoration(labelText: 'Despesas'),
                onSaved: (value) => _formData['spending'] = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                initialValue: _formData['donation'],
                decoration: InputDecoration(labelText: 'Doações'),
                onSaved: (value) => _formData['donation'] = value,
              ),
              TextFormField(
                initialValue: _formData['volunteers'],
                decoration: InputDecoration(labelText: 'Voluntários'),
                onSaved: (value) => _formData['volunteers'] = value,
              ),
              TextFormField(
                initialValue: _formData['details'],
                decoration: InputDecoration(labelText: 'Detalhes'),
                onSaved: (value) => _formData['details'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
