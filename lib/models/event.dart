import 'package:flutter/material.dart';

class Event {
  final String id;
  final String name;
  final String startDate;
  final String endDate;
  final String spending;
  final String donation;
  final String volunteers;
  final String details;

  const Event({
    this.id,
    @required this.name,
    @required this.startDate,
    @required this.endDate,
    @required this.spending,
    @required this.donation,
    @required this.volunteers,
    @required this.details,
  });
}
