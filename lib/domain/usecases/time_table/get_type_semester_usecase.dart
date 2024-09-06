import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';
import 'package:sgu_portable/domain/repositories/time_table_repository.dart';

class GetTypeSemesterUsecase implements UseCase<dynamic, NoParams> {
  final TimeTableRepository repository;

  GetTypeSemesterUsecase({required this.repository});

  @override
  Future<TypeSemesterEntity> call({NoParams? params}) async {
    return await repository.getTypeSemester();
  }
}
