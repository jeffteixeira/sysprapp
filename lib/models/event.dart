import 'package:flutter/material.dart';

class Event {
  final String id;
  final String name;
  final String date;
  final String spending;
  final String donation;

  const Event({
    this.id,
    @required this.name,
    @required this.date,
    @required this.spending,
    @required this.donation,
  });
}
