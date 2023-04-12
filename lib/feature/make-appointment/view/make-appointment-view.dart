import 'package:app_dentristy_mobile/core/widget/footer.dart';
import 'package:app_dentristy_mobile/feature/make-appointment/controller/make_appointment_controller.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';

class MakeAppointmentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MakeAppointmentController>();

    // var dropDownValue = controller.listClinic[0];

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
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.only(left: 10.w, right: 16.w, top: 16.h),
                child: Form(
                  key: controller.appointmentFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                labelText: 'Chọn phòng khám',
                                prefixIcon: Icon(Icons.home)),
                            value: controller.listClinic[0],
                            isExpanded: true,
                            items: controller.listClinic.map((clinic) {
                              controller.clinicControler.text =
                                  controller.listClinic[0].address.toString();
                              return DropdownMenuItem(
                                child: Text(clinic.address.toString()),
                                value: clinic,
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.clinicControler.text =
                                  value!.id.toString();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller: controller.nameController,
                            decoration: const InputDecoration(
                                labelText: 'Nhập tên',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.account_box_outlined)),
                            validator: controller.validator,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller: controller.phoneController,
                            decoration: const InputDecoration(
                                labelText: 'Nhập số điện thoại',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.phone)),
                            validator: controller.validator,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller: controller.contentController,
                            decoration: const InputDecoration(
                                labelText: 'Nội dung',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.edit_document)),
                            validator: controller.validator,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller: dateinput,
                            validator: controller.validator,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(
                                    Icons.calendar_today), //icon of text field
                                labelText:
                                    "Chọn ngày khám" //label text of field
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
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 55.h,
                          padding: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 7,
                                )
                              ]),
                          child: TextFormField(
                            controller: timeInput,
                            validator: controller.validator,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(Icons.alarm),
                                labelText: "Chọn giờ khám"),
                            readOnly: true,
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());

                              if (pickedTime != null) {
                                String formattedTime =
                                    '${pickedTime.hour}:${pickedTime.minute}';
                                timeInput.text = formattedTime;
                                controller.timeController.text = timeInput.text;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
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
              );
      }),
      bottomNavigationBar: getFooter(),
    );
  }
}
