import 'package:flutter/material.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';

class AppDropdownTypeSemester extends StatelessWidget {
  final TypeSemesterEntity value;
  final Function(int?) onChanged;

  const AppDropdownTypeSemester(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: value.dsDoiTuongTkb?.first.loaiDoiTuong,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: value.dsDoiTuongTkb
          ?.map((e) => DropdownMenuItem<int>(
                value: e.loaiDoiTuong,
                child: Text(e.tenDoiTuong ?? ''),
              ))
          .toList(),
    );
  }
}
