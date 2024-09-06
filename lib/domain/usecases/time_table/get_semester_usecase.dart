import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';

class GetListSemesterUsecase implements UseCase<dynamic, NoParams> {
  final TimeTableRepository repository;

  GetListSemesterUsecase({required this.repository});

  @override
  Future<ListSemesterEntity> call({NoParams? params}) async {
    return await repository.getListSemester();
  }
}
