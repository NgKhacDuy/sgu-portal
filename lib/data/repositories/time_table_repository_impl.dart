import 'package:sgu_portable/data/datasource/remote/time_table_remote_data_source.dart';
import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/time_table_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';

class TimeTableRepositoryImpl implements TimeTableRepository {
  final TimeTableRemoteDataSource timeTableDataSource;

  TimeTableRepositoryImpl({required this.timeTableDataSource});

  @override
  Future<TimeTableEntity> getTimeTable() async {
    return timeTableDataSource.getTimeTable();
  }

  @override
  Future<ListSemesterEntity> getListSemester() {
    return timeTableDataSource.getListSemester();
  }

  @override
  Future<TypeSemesterEntity> getTypeSemester() {
    return timeTableDataSource.getTypeSemester();
  }
}
