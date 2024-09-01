// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sgu_portable/core/usecase/usecase.dart';
import 'package:sgu_portable/domain/entities/time_table_entity.dart';
import 'package:sgu_portable/domain/usecases/time_table/get_semester_usecase.dart';
import 'package:sgu_portable/injection_container.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late GetListSemesterUsecase getListSemesterUsecase;
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    GetIt.I.reset();
    SharedPreferences.setMockInitialValues({});
    await initInjection();
    sl<SharedPreferences>().setString("token",
        "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ii04MjI0Nzg2NjQ3NDkyMzAzMDU1IiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IjMxMjA0MTAwOTQiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL2FjY2Vzc2NvbnRyb2xzZXJ2aWNlLzIwMTAvMDcvY2xhaW1zL2lkZW50aXR5cHJvdmlkZXIiOiJBU1AuTkVUIElkZW50aXR5IiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiIxMzA2MzEzODQwMDgxNzk2Nzk3IiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU0lOSFZJRU4iLCJzZXNzaW9uIjoiLTY5MDk3NDYzMTg4NzQzODI3MTEiLCJkdnBjIjoiLTc2NDg0NjY0NTU5NjU0MzQ0NzgiLCJuYW1lIjoiTmd1eeG7hW4gS2jhuq9jIER1eSIsInBhc3N0eXBlIjoiMCIsInVjdiI6IjY0MjA0ODQ5MCIsInByaW5jaXBhbCI6IjIwMDJuZ3V5ZW5raGFjZHV5QGdtYWlsLmNvbSIsIndjZiI6IjAiLCJuYmYiOjE3MjQ5MTEzMDIsImV4cCI6MTcyNDkxODUwMiwiaXNzIjoiZWR1c29mdCIsImF1ZCI6ImFsbCJ9.afope9nf3q86Fd4NHuXgc0dYq9eR6TpRpqErNXjbfdo");
    getListSemesterUsecase = sl();
  });

  group("time table repository", () {
    test("get list semester", () async {
      var response = await getListSemesterUsecase.call(params: NoParams());
      expect(response.runtimeType, TimeTableEntity);
    });
  });
}
