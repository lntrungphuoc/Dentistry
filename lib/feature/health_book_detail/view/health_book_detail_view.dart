import 'package:app_dentristy_mobile/feature/health_book_detail/controller/health_book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                                generateServiceString(controller, index),
                                style: TextStyle(
                                    fontSize: 16.sp,),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                generateDoctorString(controller, index),
                                style: TextStyle(
                                    fontSize: 16.sp,),
                              ),
                            ),
                            // Theme(
                            //   data: Theme.of(context)
                            //       .copyWith(dividerColor: Colors.transparent),
                            //   child: ExpansionTile(
                            //     title: Text("Dịch vụ"),
                            //     children: List.generate(
                            //         controller.listHealthBookDetail[index]
                            //             .eHealthBookDetailServices.length, (i) {
                            //       return Align(
                            //         alignment: Alignment.centerLeft,
                            //         child: Padding(
                            //           padding: EdgeInsets.symmetric(
                            //               vertical: 5.h, horizontal: 16.w),
                            //           child: Text(
                            //               controller
                            //                   .listHealthBookDetail[index]
                            //                   .eHealthBookDetailServices[i]
                            //                   .service
                            //                   .name,
                            //               style: TextStyle(fontSize: 15.sp)),
                            //         ),
                            //       );
                            //     }),
                            //   ),
                            // ),
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
                                        onPressed: () {
                                          controller.downloadFile(controller
                                              .listHealthBookDetail[index]
                                              .attachments[i]
                                              .url);
                                        },
                                        label: Text(
                                            controller
                                                .listHealthBookDetail[index]
                                                .attachments[i]
                                                .url,
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

  String generateServiceString(
      HealthBookDetailController controller, int index) {
    var res = "";
    int length =
        controller.listHealthBookDetail[index].eHealthBookDetailServices.length;
    for (int i = 0; i < length - 1; i++) {
      res = res +
          controller.listHealthBookDetail[index].eHealthBookDetailServices[i]
              .service.name +
          ", ";
    }
    res = res +
        controller.listHealthBookDetail[index]
            .eHealthBookDetailServices[length - 1].service.name;
    return res;
  }

  String generateDoctorString(
      HealthBookDetailController controller, int index) {
    var res = "";
    int length =
        controller.listHealthBookDetail[index].eHealthBookDetailDoctor.length;
    for (int i = 0; i < length - 1; i++) {
      res = res +
          controller.listHealthBookDetail[index].eHealthBookDetailDoctor[i]
              .doctor.name +
          ", ";
    }
    res = res +
        controller.listHealthBookDetail[index]
            .eHealthBookDetailDoctor[length - 1].doctor.name;
    return res;
  }

  DataTable health_book_detail_table(HealthBookDetailController controller) {
    return DataTable(
        dataRowHeight: rowCount(controller) * 20.h + 30.h,
        columns: const [
          DataColumn(label: Text("STT")),
          DataColumn(
            label: Text('Chẩn đoán'),
          ),
          DataColumn(label: Text('Thuốc')),
          DataColumn(
            label: Text('Bác sĩ'),
          ),
          DataColumn(
            label: Text('Dịch vụ'),
          ),
        ],
        rows: List.generate(controller.listHealthBookDetail.length, (index) {
          return DataRow(cells: [
            DataCell(SizedBox(
                // height: rowCount * 0,
                child: Text((index + 1).toString()))),
            DataCell(SizedBox(
              // height: rowCount * 0,
              child: Text(
                  controller.listHealthBookDetail[index].diagnose.toString()),
            )),
            DataCell(SizedBox(
              // height: rowCount * 0,
              child: Text(
                  controller.listHealthBookDetail[index].medicine.toString()),
            )),
            DataCell(SizedBox(
              // height: rowCount * 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                    controller.listHealthBookDetail[index]
                        .eHealthBookDetailDoctor.length, (i) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(controller.listHealthBookDetail[index]
                        .eHealthBookDetailDoctor[i].doctor.name),
                  );
                }),
              ),
            )),
            DataCell(Container(
              // height: rowCount * 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                    controller.listHealthBookDetail[index]
                        .eHealthBookDetailServices.length, (i) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    child: Text(controller.listHealthBookDetail[index]
                        .eHealthBookDetailServices[i].service.name),
                  );
                }),
              ),
            )),
          ]);
        }));
  }

  int rowCount(controller) {
    int count = 0;
    for (int i = 0; i < controller.listHealthBookDetail.length; i++) {
      int max = controller
                  .listHealthBookDetail[i].eHealthBookDetailServices.length >
              controller.listHealthBookDetail[i].eHealthBookDetailDoctor.length
          ? controller.listHealthBookDetail[i].eHealthBookDetailServices.length
          : controller.listHealthBookDetail[i].eHealthBookDetailDoctor.length;
      count = count > max ? count : max;
    }
    print(count);
    return count;
  }
}
