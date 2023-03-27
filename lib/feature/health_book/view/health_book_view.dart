import 'package:app_dentristy_mobile/core/widget/footer.dart';
import 'package:app_dentristy_mobile/feature/health_book/binding/health_book_biding.dart';
import 'package:app_dentristy_mobile/feature/health_book/controller/health_book_controller.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthBookView extends StatelessWidget {
  const HealthBookView({super.key});

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
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        dataRowHeight: rowCount(controller) * 30,
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
                        rows: List.generate(controller.listHealthBook.length,
                            (index) {
                          return DataRow(cells: [
                            DataCell(Text((index + 1).toString())),
                            DataCell(Text(DateFormat("yyyy-MM-dd")
                                .format(controller
                                    .listHealthBook[index].createdDate)
                                .toString())),
                            DataCell(Text(controller
                                .listHealthBook[index].clinic.address
                                .toString())),
                            DataCell(Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  controller.listHealthBook[index]
                                      .eHealthBookServices.length, (i) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    controller.listHealthBook[index]
                                        .eHealthBookServices[i].service.name,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }),
                            )),
                            DataCell(Text(controller
                                .listHealthBook[index].totalFee
                                .toString())),
                            DataCell(IconButton(
                              onPressed: () {
                                Get.toNamed("/health_book_detail",
                                    arguments:
                                        controller.listHealthBook[index].id);
                              },
                              icon: const Icon(
                                Icons.info_outline,
                                color: Colors.blue,
                              ),
                            )),
                          ]);
                        })),
                  ),
                ],
              );
      }),
      bottomNavigationBar: getFooter(),
    );
  }

  int rowCount(controller) {
    int count = 0;
    for (int i = 0; i < controller.listHealthBook.length; i++) {
      count = count > controller.listHealthBook.length
          ? count
          : controller.listHealthBook.length;
    }
    return count;
  }
}
