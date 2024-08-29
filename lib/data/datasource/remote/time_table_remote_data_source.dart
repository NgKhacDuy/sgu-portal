import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/core/network/client_request.dart';
import 'package:sgu_portable/core/network/network_compute.dart';
import 'package:sgu_portable/domain/entities/time_table_entity.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TimeTableRemoteDataSource {
  Future<TimeTableEntity> getListSemester();
  Future<void> getTimeTable();
}

class TimeTableRemoteDataSourceImpl implements TimeTableRemoteDataSource {
  @override
  Future<TimeTableEntity> getListSemester() async {
    try {
      final response = await request(
        ClientRequest(
            url: '/sch/w-locdsdoituongthoikhoabieuhocky',
            method: 'post',
            options: Options(
              method: 'post',
              headers: {
                "authorization":
                    "Bearer ${sl<SharedPreferences>().getString("token")}"
              },
            )),
      );
      return TimeTableEntity.fromJson(response["data"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> getTimeTable() {
    // TODO: implement getTimeTable
    throw UnimplementedError();
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
