import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../core/widget/footer.dart';

class HealthBookDetailView extends StatelessWidget {
  const HealthBookDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    var healthBookId = Get.arguments;
    var list = [
      {
        "checkUpDate": "2023-3-25",
        "diagnose": "Bình thường",
        "medicine": "Không",
        "reExaminationDate": "",
        "doctor": "Lê Văn A",
        "service": "Khám răng"
      },
      {
        "checkUpDate": "2023-3-25",
        "diagnose": "Bình thường",
        "medicine": "Panadol",
        "reExaminationDate": "",
        "doctor": "Trần Thị B",
        "service": "Nhổ răng"
      },
    ];
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columns: const [
              DataColumn(label: Text("STT")),
              DataColumn(
                label: Text('Ngày khám'),
              ),
              DataColumn(
                label: Text('Chẩn đoán'),
              ),
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
            rows: List.generate(list.length, (index) {
              return DataRow(cells: [
                DataCell(Text((index + 1).toString())),
                DataCell(Text(list[index]['checkUpDate'].toString())),
                DataCell(Text(list[index]['diagnose'].toString())),
                DataCell(Text(list[index]['medicine'].toString())),
                DataCell(Text(list[index]['doctor'].toString())),
                DataCell(Text(list[index]['service'].toString())),
              ]);
            })),
      ),
      bottomNavigationBar: getFooter(),
    );
  }
}
