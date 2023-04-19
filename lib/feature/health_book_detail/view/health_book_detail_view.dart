import 'dart:io';

import 'package:app_dentristy_mobile/feature/health_book_detail/controller/health_book_detail_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/widget/footer.dart';

class HealthBookDetailView extends StatefulWidget {
  const HealthBookDetailView({super.key});

  @override
  State<HealthBookDetailView> createState() => _HealthBookDetailViewState();
}

class _HealthBookDetailViewState extends State<HealthBookDetailView> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HealthBookDetailController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Chi tiết sổ sức khỏe',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: List.generate(
                        controller.listHealthBookDetail.length, (index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0, 3))
                          ]),
                      child: Card(
                        elevation: 0,
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.view_list),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                controller.generateServiceString(index),
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.blue),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                controller.generateDoctorString(index),
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.edit_document),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                  controller
                                      .listHealthBookDetail[index].diagnose
                                      .toString(),
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            ListTile(
                              leading: Icon(Icons.medication_outlined),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                  controller
                                      .listHealthBookDetail[index].medicine
                                      .toString(),
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text("Tài liệu"),
                                children: List.generate(
                                    controller.listHealthBookDetail[index]
                                        .attachments.length, (i) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 16.w),
                                      child: TextButton.icon(
                                        onPressed: () async {
                                         await controller.openFile(
                                              url: controller
                                                  .listHealthBookDetail[index]
                                                  .attachments[i]
                                                  .url,
                                              fileName: controller
                                                  .listHealthBookDetail[index]
                                                  .attachments[i]
                                                  .fileName);
                                          // controller.downloadFile(controller
                                          //       .listHealthBookDetail[index]
                                          //       .attachments[i]
                                          //       .url);
                                        },
                                        label: Text(
                                            controller
                                                .listHealthBookDetail[index]
                                                .attachments[i]
                                                .fileName,
                                            style: TextStyle(fontSize: 15.sp)),
                                        icon: Icon(Icons.download),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
              );
      }),
      bottomNavigationBar: getFooter(),
    );
  }

  
}
