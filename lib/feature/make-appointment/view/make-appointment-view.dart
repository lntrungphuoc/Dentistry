import 'package:app_dentristy_mobile/core/widget/footer.dart';
import 'package:app_dentristy_mobile/feature/make-appointment/controller/make_appointment_controller.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';

class MakeAppointmentView extends GetView<MakeAppointmentController> {
  @override
  Widget build(BuildContext context) {
    var listClinic = [
      {
        "id": 1,
        "address": "15 Le Loi",
      },
      {
        "id": 2,
        "address": "15 Nguyen Hue",
      },
      {
        "id": 3,
        "address": "15 Hai Ba Trung",
      },
    ];

    var dropDownValue = listClinic[0];

    TextEditingController dateinput = TextEditingController();

    TextEditingController timeInput = TextEditingController();

    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'Đặt lịch',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.appointmentFormKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Chọn phòng khám'),
                  value: dropDownValue,
                  isExpanded: true,
                  items: listClinic.map((clinic) {
                    controller.clinicControler.text =
                        dropDownValue['address'].toString();
                    return DropdownMenuItem(
                      child: Text(clinic['address'].toString()),
                      value: clinic,
                    );
                  }).toList(),
                  onChanged: (value) {
                    dropDownValue = value as Map<String, Object>;
                    controller.clinicControler.text =
                        dropDownValue['address'].toString();
                  },
                ),
                TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(labelText: 'Nhập tên'),
                  validator: controller.validator,
                ),
                TextFormField(
                  controller: controller.phoneController,
                  decoration:
                      const InputDecoration(labelText: 'Nhập số điện thoại'),
                  validator: controller.validator,
                ),
                TextFormField(
                  controller: controller.contentController,
                  decoration: const InputDecoration(labelText: 'Nội dung'),
                  validator: controller.validator,
                ),
                TextFormField(
                  controller: dateinput,
                  validator: controller.validator,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Chọn ngày khám" //label text of field
                      ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        initialDate: DateTime.now());

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      dateinput.text = formattedDate;
                      controller.dateController.text = dateinput.text;
                    }
                  },
                ),
                TextFormField(
                  controller: timeInput,
                  validator: controller.validator,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.alarm), labelText: "Chọn giờ khám"),
                  readOnly: true,
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    if (pickedTime != null) {
                      String formattedTime =
                          pickedTime.format(context).toString();
                      timeInput.text = formattedTime;
                      controller.timeController.text = timeInput.text;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    controller.makeAppointment(context);
                  },
                  child: Text(
                    "Đặt lịch hẹn",
                    style: TextStyles.titleNormal.white,
                  ).p(3),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: getFooter(),
    );
  }
}
