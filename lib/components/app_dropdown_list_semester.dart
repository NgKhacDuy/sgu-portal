import 'package:flutter/material.dart';
import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';

class AppDropdownListSemester extends StatelessWidget {
  final ListSemesterEntity value;
  final Function(int?) onChanged;

  const AppDropdownListSemester(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: value.dsHocKy?.first.hocKy,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: value.dsHocKy
          ?.map((e) => DropdownMenuItem<int>(
                value: e.hocKy,
                child: Text(e.tenHocKy ?? ''),
              ))
          .toList(),
    );
  }
}
