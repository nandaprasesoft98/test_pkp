import 'package:flutter/material.dart';

class _Constant {
  BorderRadius get inputBorderRadius => BorderRadius.circular(16.0);
  double get inputBorderWidth => 1.5;
  Color get colorTextFieldBorder => const Color.fromRGBO(220, 220, 220, 1);

  String get bioHiveTableName => "bio-hive-table";
}

// ignore: non_constant_identifier_names
final Constant = _Constant();