import 'package:app_dentristy_mobile/core/widget/footer.dart';
import 'package:app_dentristy_mobile/feature/health_book/binding/health_book_biding.dart';
import 'package:app_dentristy_mobile/feature/health_book/controller/health_book_controller.dart';
import 'package:app_dentristy_mobile/service/implementations/notify_services.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthBookView extends StatefulWidget {
  const HealthBookView({super.key});

  @override
  State<HealthBookView> createState() => _HealthBookViewState();
}

class _HealthBookViewState extends State<HealthBookView> {
  DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm');
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HealthBookController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Sổ sức khỏe',
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
                child: list_health_book_card(controller),
              );
      }),
      bottomNavigationBar: getFooter(),
    );
  }

  Column list_health_book_card(HealthBookController controller) {
    return Column(
      children: List.generate(controller.listHealthBook.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: GestureDetector(
            onTap: () {
              Get.toNamed("/health_book_detail",
                  arguments: controller.listHealthBook[index].id);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3))
                  ]),
              child: Card(
                elevation: 0,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.view_list,
                        color: Colors.lightBlue,
                      ),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                        controller.generateServiceString(index),
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.lightBlue,
                      ),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          DateFormat("yyyy-MM-dd")
                              .format(
                                  controller.listHealthBook[index].checkUpDate)
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: Colors.lightBlue,
                      ),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          controller.listHealthBook[index].clinic.address
                              .toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.attach_money,
                        color: Colors.lightBlue,
                      ),
                      visualDensity: VisualDensity(vertical: -3.h),
                      title: Text(
                          controller.listHealthBook[index].totalFee.toString(),
                          style: TextStyle(fontSize: 15.sp)),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text("Tái khám"),
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.lightBlue,
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  NotificationService notifyService =
                                      NotificationService();
                                  // var examDate = DateTime.parse(
                                  //     '2023-05-05 10:35:00.0000000');
                                  var parsedDate = controller
                                      .listHealthBook[index].reExaminationDate!
                                      .subtract(Duration(days: 1));
                                  var strDate = formatter.format(parsedDate);
                                  notifyService.scheduleNotification(
                                      title: 'Thông báo',
                                      body:
                                          'Bạn sẽ có lịch tái khám vào ${strDate}',
                                      scheduledNotificationDateTime:
                                          parsedDate);
                                },
                                icon: const Icon(
                                  Icons.notifications,
                                  color: Colors.lightBlue,
                                )),
                            visualDensity: VisualDensity(vertical: -3.h),
                            title: Text(
                                controller.listHealthBook[index]
                                            .reExaminationDate ==
                                        null
                                    ? ''
                                    : formatter.format(controller
                                        .listHealthBook[index]
                                        .reExaminationDate!),
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.book,
                              color: Colors.lightBlue,
                            ),
                            visualDensity: VisualDensity(vertical: -3.h),
                            title: Text(
                                controller.listHealthBook[index].note == null
                                    ? ''
                                    : controller.listHealthBook[index].note!,
                                style: TextStyle(fontSize: 15.sp)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  DataTable health_book_table(HealthBookController controller) {
    return DataTable(
        dataRowHeight: rowCount(controller) * 20.h + 20.h,
        columns: const [
          DataColumn(label: Text("STT")),
          DataColumn(
            label: Text('Ngày khám'),
          ),
          DataColumn(
            label: Text('Phòng khám'),
          ),
          DataColumn(
            label: Text('Dịch vụ'),
          ),
          DataColumn(
            label: Text('Tổng chi phí'),
          ),
          DataColumn(
            label: Text('Thao tác'),
          ),
        ],
        rows: List.generate(controller.listHealthBook.length, (index) {
          return DataRow(cells: [
            DataCell(Text((index + 1).toString())),
            DataCell(Text(DateFormat("yyyy-MM-dd")
                .format(controller.listHealthBook[index].createdDate)
                .toString())),
            DataCell(Text(
                controller.listHealthBook[index].clinic.address.toString())),
            DataCell(Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  controller.listHealthBook[index].eHealthBookServices.length,
                  (i) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    controller.listHealthBook[index].eHealthBookServices[i]
                        .service.name,
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            )),
            DataCell(
                Text(controller.listHealthBook[index].totalFee.toString())),
            DataCell(IconButton(
              onPressed: () {
                Get.toNamed("/health_book_detail",
                    arguments: controller.listHealthBook[index].id);
              },
              icon: const Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
            )),
          ]);
        }));
  }

  int rowCount(controller) {
    int count = 0;
    for (int i = 0; i < controller.listHealthBook.length; i++) {
      count = count > controller.listHealthBook[i].eHealthBookServices.length
          ? count
          : controller.listHealthBook[i].eHealthBookServices.length;
    }
    print(count);
    return count;
  }
}
