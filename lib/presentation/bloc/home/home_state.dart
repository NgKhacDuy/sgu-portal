import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final ListSemesterEntity semester;
  final TypeSemesterEntity typeSemesters;

  HomeLoaded({required this.semester, required this.typeSemesters});
}
