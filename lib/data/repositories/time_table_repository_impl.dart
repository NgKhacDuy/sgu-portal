import 'package:sgu_portable/data/datasource/remote/time_table_remote_data_source.dart';
import 'package:sgu_portable/domain/entities/time_table_entity.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';

class TimeTableRepositoryImpl implements TimeTableRepository {
  final TimeTableRemoteDataSource timeTableDataSource;

  TimeTableRepositoryImpl({required this.timeTableDataSource});

  @override
  Future<void> getTimeTable() async {
    return timeTableDataSource.getTimeTable();
  }

  @override
  Future<TimeTableEntity> getListSemester() {
    return timeTableDataSource.getListSemester();
  }
}
