import 'package:sgu_portable/domain/entities/time_table_entity.dart';

abstract class TimeTableRepository {
  Future<TimeTableEntity> getListSemester();
  Future<void> getTimeTable();
}
