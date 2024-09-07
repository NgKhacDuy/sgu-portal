import 'package:flutter/material.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';

class AppDropdownTypeSemester extends StatelessWidget {
  final int value;
  final TypeSemesterEntity model;
  final Function(int?) onChanged;

  const AppDropdownTypeSemester(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: value,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: model.dsDoiTuongTkb
          ?.map((e) => DropdownMenuItem<int>(
                value: e.loaiDoiTuong,
                child: Text(e.tenDoiTuong ?? ''),
              ))
          .toList(),
    );
  }
}
