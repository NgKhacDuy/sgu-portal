import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/network/client_request.dart';
import 'package:sgu_portable/core/network/network_compute.dart';
import 'package:sgu_portable/domain/entities/time_table/list_semester_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/time_table_entity.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';
import 'package:sgu_portable/injection_container.dart';

abstract class TimeTableRemoteDataSource {
  Future<ListSemesterEntity> getListSemester();
  Future<TypeSemesterEntity> getTypeSemester();
  Future<TimeTableEntity> getTimeTable();
}

class TimeTableRemoteDataSourceImpl implements TimeTableRemoteDataSource {
  @override
  Future<ListSemesterEntity> getListSemester() async {
    try {
      final response = await request(
        ClientRequest(
            url: '/sch/w-locdshockytkbuser',
            method: 'post',
            options: Options(
              method: 'post',
              headers: {
                "authorization": "Bearer ${GetStorage().read("token")}"
              },
            )),
      );
      return ListSemesterEntity.fromJson(response["data"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TimeTableEntity> getTimeTable() {
    throw UnimplementedError();
  }

  @override
  Future<TypeSemesterEntity> getTypeSemester() async {
    try {
      final response = await request(
        ClientRequest(
            url: '/sch/w-locdsdoituongthoikhoabieuhocky',
            method: 'post',
            options: Options(
              method: 'post',
              headers: {
                "authorization": "Bearer ${GetStorage().read("token")}"
              },
            )),
      );
      return TypeSemesterEntity.fromJson(response["data"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> request(ClientRequest clientRequest) async {
    try {
      final response =
          await compute(sl<NetworkCompute>().fetchCompute, clientRequest);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException(response.statusCode!);
      }
    } catch (e) {
      rethrow;
    }
  }
}
