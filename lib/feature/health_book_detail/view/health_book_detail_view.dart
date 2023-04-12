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
                              leading: Icon(Icons.calendar_month_outlined),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                  DateFormat("yyyy-MM-dd")
                                      .format(controller
                                          .listHealthBookDetail[index]
                                          .checkUpDate)
                                      .toString(),
                                  style: TextStyle(fontSize: 15.sp)),
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
                            ListTile(
                              leading: Icon(Icons.calendar_month_outlined),
                              visualDensity: VisualDensity(vertical: -3.h),
                              title: Text(
                                  DateFormat("yyyy-MM-dd")
                                      .format(controller
                                          .listHealthBookDetail[index]
                                          .reExaminationDate)
                                      .toString(),
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text("Dịch vụ"),
                                children: List.generate(
                                    controller.listHealthBookDetail[index]
                                        .eHealthBookDetailServices.length, (i) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 16.w),
                                      child: Text(
                                          controller
                                              .listHealthBookDetail[index]
                                              .eHealthBookDetailServices[i]
                                              .service
                                              .name,
                                          style: TextStyle(fontSize: 15.sp)),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text("Bác sĩ"),
                                children: List.generate(
                                    controller.listHealthBookDetail[index]
                                        .eHealthBookDetailDoctor.length, (i) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 16.w),
                                      child: Text(
                                          controller
                                              .listHealthBookDetail[index]
                                              .eHealthBookDetailDoctor[i]
                                              .doctor
                                              .name,
                                          style: TextStyle(fontSize: 15.sp)),
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

  Column list_health_book_detail_card(HealthBookDetailController controller) {
    return Column(
        children:
            List.generate(controller.listHealthBookDetail.length, (index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
          child: Expanded(
            child: Card(
              elevation: 0,
              child: Expanded(
                child: Column(children: [
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.calendar_month_outlined),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          DateFormat("yyyy-MM-dd")
                              .format(controller
                                  .listHealthBookDetail[index].checkUpDate)
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.edit_document),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          controller.listHealthBookDetail[index].diagnose
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.medication_outlined),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          controller.listHealthBookDetail[index].medicine
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      leading: Icon(Icons.calendar_month_outlined),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          DateFormat("yyyy-MM-dd")
                              .format(controller.listHealthBookDetail[index]
                                  .reExaminationDate)
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text("Dịch vụ"),
                      children: List.generate(
                          controller.listHealthBookDetail[index]
                              .eHealthBookDetailServices.length, (i) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 16.w),
                            child: Text(
                                controller.listHealthBookDetail[index]
                                    .eHealthBookDetailServices[i].service.name,
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                        );
                      }),
                    ),
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text("Bác sĩ"),
                      children: List.generate(
                          controller.listHealthBookDetail[index]
                              .eHealthBookDetailDoctor.length, (i) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 16.w),
                            child: Text(
                                controller.listHealthBookDetail[index]
                                    .eHealthBookDetailDoctor[i].doctor.name,
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                        );
                      }),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
    }));
  }

  DataTable health_book_detail_table(HealthBookDetailController controller) {
    return DataTable(
        dataRowHeight: rowCount(controller) * 20.h + 30.h,
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
        rows: List.generate(controller.listHealthBookDetail.length, (index) {
          return DataRow(cells: [
            DataCell(SizedBox(
                // height: rowCount * 0,
                child: Text((index + 1).toString()))),
            DataCell(SizedBox(
              // height: rowCount * 0,
              child: Text(DateFormat("yyyy-MM-dd")
                  .format(controller.listHealthBookDetail[index].checkUpDate)
                  .toString()),
            )),
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
              child: Text(DateFormat("yyyy-MM-dd")
                  .format(
                      controller.listHealthBookDetail[index].reExaminationDate)
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
