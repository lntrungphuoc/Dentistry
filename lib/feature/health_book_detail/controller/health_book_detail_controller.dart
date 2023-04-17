import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:app_dentristy_mobile/core/repository/interfaces/i_health_book_detail_repository.dart';
import 'package:app_dentristy_mobile/model/e_healthbook_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/repository/implementations/health_book_detail_repository.dart';

class HealthBookDetailController extends GetxController {
  late IHealthBookDetailRepository _healthBookDetailRepository;

  HealthBookDetailController() {
    _healthBookDetailRepository = Get.find<HealthBookDetailRepository>();
    getByIdHealthBook();
    initDownloader();
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  final ReceivePort _port = ReceivePort();


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

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  initDownloader() async {
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
  _port.listen((dynamic data) {
    String id = data[0];
    DownloadTaskStatus status = data[1];
    int progress = data[2];
  });

  FlutterDownloader.registerCallback(downloadCallback);
  }

  

  downloadFile(url) async {
    print(url);
    final baseStorage = await getExternalStorageDirectory();
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/storage/emulated/0/Download',
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}
