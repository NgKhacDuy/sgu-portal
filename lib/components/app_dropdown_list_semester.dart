import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';

class AppDropdownListSemester extends StatelessWidget {
  final int value;
  final ListSemesterEntity model;
  final Function(int?) onChanged;

  const AppDropdownListSemester(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        value: value,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        buttonStyleData: ButtonStyleData(
          width: MediaQuery.of(context).size.width * 0.66,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
          ),
        ),
        onChanged: onChanged,
        items: model.dsHocKy
            ?.map((e) => DropdownMenuItem<int>(
                  value: e.hocKy,
                  child: Text(e.tenHocKy ?? ''),
                ))
            .toList(),
      ),
    );
  }
}
