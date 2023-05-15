import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_detail_repository.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/repository/implementations/health_book_detail_repository.dart';

class HealthBookDetailController extends GetxController {
  late IHealthBookDetailRepository _healthBookDetailRepository;

  HealthBookDetailController() {
    _healthBookDetailRepository = Get.find<HealthBookDetailRepository>();
    getByIdHealthBook();
  }

  late RxList<EHealthBookDetail> listHealthBookDetail;

  RxBool isLoading = false.obs;

  void getByIdHealthBook() async {
    showLoading();

    var healthBookId = Get.arguments;

    var response =
        await _healthBookDetailRepository.getByHealthBookId(healthBookId);

    hideLoading();

    if (response != null) {
      listHealthBookDetail = response.obs;
    } else {
      print('No eHealthBookDetail data is found');
    }
  }

  Future<void> refreshData() async {
    showLoading();

    var healthBookId = Get.arguments;

    var response =
        await _healthBookDetailRepository.getByHealthBookId(healthBookId);

    hideLoading();

    if (response != null) {
      listHealthBookDetail = response.obs;
    } else {
      print('No eHealthBookDetail data is found');
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!).then((value) async {
      // print(value!.path);
      return await OpenFile.open(value!.path);
    });
    if (file == null) return;

    // print('Path: ${file.path}');
    // // OpenFilex.open(file.path);
   
    // try {
    //   await OpenFile.open(file.path);
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<File?> downloadFile(String url, String fileName) async {
    final appStorage = await getApplicationDocumentsDirectory();

    final file = File('/storage/emulated/0/Download/$fileName');
    // final file = File('${appStorage.path}/$fileName');

    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          // receiveTimeout: Duration(seconds: 0),
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } on Exception catch (e) {
      return null;
    }
  }

  String generateServiceString(int index) {
    var res = "";
    int length = listHealthBookDetail[index].eHealthBookDetailServices.length;
    for (int i = 0; i < length - 1; i++) {
      res =
          "$res${listHealthBookDetail[index].eHealthBookDetailServices[i].service.name}, ";
    }
    res = res +
        listHealthBookDetail[index]
            .eHealthBookDetailServices[length - 1]
            .service
            .name;
    return res;
  }

  String generateDoctorString(int index) {
    var res = "";
    int length = listHealthBookDetail[index].eHealthBookDetailDoctor.length;
    for (int i = 0; i < length - 1; i++) {
      res =
          "$res${listHealthBookDetail[index].eHealthBookDetailDoctor[i].doctor.name}, ";
    }
    res = res +
        listHealthBookDetail[index]
            .eHealthBookDetailDoctor[length - 1]
            .doctor
            .name;
    return res;
  }
}
