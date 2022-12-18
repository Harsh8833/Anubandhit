import 'package:flutter/material.dart';

void appSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
