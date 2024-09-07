class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class HomeChangeTypeSemester extends HomeEvent {
  final int typeSemester;
  HomeChangeTypeSemester({required this.typeSemester});
}

class HomeChangeListSemester extends HomeEvent {
  final int semester;
  HomeChangeListSemester({required this.semester});
}
