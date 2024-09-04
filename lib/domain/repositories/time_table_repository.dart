import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/time_table_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';

abstract class TimeTableRepository {
  Future<ListSemesterEntity> getListSemester();
  Future<TypeSemesterEntity> getTypeSemester();
  Future<TimeTableEntity> getTimeTable();
}
