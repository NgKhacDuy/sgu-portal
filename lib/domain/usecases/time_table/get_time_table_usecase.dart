import 'package:sgu_portable/core/params/time_table_param.dart';
import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/time_table/time_table_entity.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';

class GettimeTableUsecase implements UseCase<dynamic, TimeTableParam> {
  final TimeTableRepository repository;

  GettimeTableUsecase({required this.repository});

  @override
  Future<TimeTableEntity> call({TimeTableParam? params}) async {
    return await repository.getTimeTable(params!);
  }
}
