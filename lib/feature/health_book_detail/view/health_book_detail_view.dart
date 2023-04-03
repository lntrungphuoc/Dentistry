import 'package:app_dentristy_mobile/feature/health_book_detail/controller/health_book_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/footer.dart';

class HealthBookDetailView extends StatelessWidget {
  const HealthBookDetailView({super.key});

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
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    dataRowHeight: rowCount(controller) * 30.h,
                    columns: const [
                      DataColumn(label: Text("STT")),
                      DataColumn(
                        label: Text('Ngày khám'),
                      ),
                      DataColumn(
                        label: Text('Chẩn đoán'),
                      ),
                      DataColumn(label: Text('Thuốc')),
                      DataColumn(
                        label: Text('Ngày tái khám'),
                      ),
                      DataColumn(
                        label: Text('Bác sĩ'),
                      ),
                      DataColumn(
                        label: Text('Dịch vụ'),
                      ),
                    ],
                    rows: List.generate(controller.listHealthBookDetail.length,
                        (index) {
                      return DataRow(cells: [
                        DataCell(SizedBox(
                            // height: rowCount * 0,
                            child: Text((index + 1).toString()))),
                        DataCell(SizedBox(
                          // height: rowCount * 0,
                          child: Text(DateFormat("yyyy-MM-dd")
                              .format(controller
                                  .listHealthBookDetail[index].checkUpDate)
                              .toString()),
                        )),
                        DataCell(SizedBox(
                          // height: rowCount * 0,
                          child: Text(controller
                              .listHealthBookDetail[index].diagnose
                              .toString()),
                        )),
                        DataCell(SizedBox(
                          // height: rowCount * 0,
                          child: Text(controller
                              .listHealthBookDetail[index].medicine
                              .toString()),
                        )),
                        DataCell(SizedBox(
                          // height: rowCount * 0,
                          child: Text(DateFormat("yyyy-MM-dd")
                              .format(controller.listHealthBookDetail[index]
                                  .reExaminationDate)
                              .toString()),
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
                                child: Text(controller
                                    .listHealthBookDetail[index]
                                    .eHealthBookDetailDoctor[i]
                                    .doctor
                                    .name),
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
                                child: Text(controller
                                    .listHealthBookDetail[index]
                                    .eHealthBookDetailServices[i]
                                    .service
                                    .name),
                              );
                            }),
                          ),
                        )),
                      ]);
                    })),
              );
      }),
      bottomNavigationBar: getFooter(),
    );
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
