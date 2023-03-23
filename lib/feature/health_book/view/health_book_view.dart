import 'package:app_dentristy_mobile/core/widget/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HealthBookView extends StatelessWidget {
  const HealthBookView({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        "createdDate": "2023-3-25",
        "clinicAddress": "15 Le Loi",
        "services": "Làm răng",
        "totalFee": 1000000
      },
      {
        "createdDate": "2023-4-24",
        "clinicAddress": "25 Nguyen Hue",
        "services": "Khám răng",
        "totalFee": 2000000
      },
      {
        "createdDate": "2023-5-25",
        "clinicAddress": "35 Hai Ba Trung",
        "services": "Nhổ răng",
        "totalFee": 3000000
      },
      {
        "createdDate": "2023-6-26",
        "clinicAddress": "15 Le Loi",
        "services": "Hehe",
        "totalFee": 4000000
      },
      {
        "createdDate": "2023-7-27",
        "clinicAddress": "25 Nguyen Hue",
        "services": "Làm răng",
        "totalFee": 5000000
      },
    ];

    var customer = {
      "name": "Nguyen Van ABC",
      "address": "20 Hai Bà Trưng",
      "phoneNumber": "0987321742",
    };

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
      body: Column(
        children: [
          // Text('Tên khách hàng'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
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
                rows: List.generate(list.length, (index) {
                  return DataRow(cells: [
                    DataCell(Text((index+1).toString())),
                    DataCell(Text(list[index]['createdDate'].toString())),
                    DataCell(Text(list[index]['clinicAddress'].toString())),
                    DataCell(Text(list[index]['services'].toString())),
                    DataCell(Text(list[index]['totalFee'].toString())),
                    DataCell(IconButton(
                      onPressed: () {
                        Get.toNamed("/health_book_detail", arguments: "${index}");
                      },
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                      ),
                    )),
                  ]);
                })

                // [
                //   DataRow(cells: [
                //     DataCell(Text('1')),
                //     DataCell(Text('Arshik')),
                //     DataCell(Text('5644645')),
                //     DataCell(Text('3')),
                //     DataCell(Text('265\$')),
                //   ])
                // ]
                ),
          ),
        ],
      ),
      bottomNavigationBar: getFooter(),
    );
  }
}
