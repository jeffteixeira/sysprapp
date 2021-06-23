import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String date;
  final String spending;
  final String donation;

  const User({
    this.id,
    @required this.name,
    @required this.date,
    @required this.spending,
    @required this.donation,
  });
}
