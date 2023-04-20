import 'dart:async';

import 'package:app_dentristy_mobile/feature/doctor/view/doctor_detail_view.dart';
import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';
import '../controller/doctor_controller.dart';

class ListDoctorView extends StatefulWidget {
  const ListDoctorView({super.key});

  @override
  State<ListDoctorView> createState() => _ListDoctorViewState();
}

class _ListDoctorViewState extends State<ListDoctorView> {
  Timer? _debounce;
  _runFilter(String value, DoctorController controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      List<Doctor> result = [];
      if (value.isEmpty) {
        result = controller.listDoctor;
      } else {
        result = controller.listDoctor.value
            .where((doctor) =>
                doctor.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }

      setState(() {
        controller.foundDoctors = result.obs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();
    return Scaffold(
        backgroundColor: LightColor.background,
        appBar: AppBar(
          backgroundColor: LightColor.background,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            "Bác Sĩ",
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
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 50.h,
                        margin: EdgeInsets.only(top: 13.h, bottom: 18.h),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: LightColor.grey.withOpacity(.3),
                              blurRadius: 15,
                              offset: const Offset(5, 5),
                            )
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) => _runFilter(value, controller),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            border: InputBorder.none,
                            hintText: "Tìm kiếm",
                            hintStyle: TextStyles.body.subTitleColor,
                            suffixIcon: SizedBox(
                                width: 50.w,
                                child: const Icon(Icons.search,
                                        color: LightColor.lightBlue)
                                    .alignCenter
                                    .ripple(() {},
                                        borderRadius:
                                            BorderRadius.circular(13.r))),
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(controller.foundDoctors.length, (index) {
                      return Container(
                          height: 90.h,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              vertical: 7.h, horizontal: 18.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: const Offset(4, 4),
                                blurRadius: 10,
                                color: LightColor.grey.withOpacity(.2),
                              ),
                              BoxShadow(
                                offset: const Offset(-3, 0),
                                blurRadius: 15,
                                color: LightColor.grey.withOpacity(.1),
                              )
                            ],
                          ),
                          child: Flexible(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              leading: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 90.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Image.network(
                                    controller.foundDoctors[index].avatarUrl,
                                    height: 90.h,
                                    width: 70.w,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(
                                  controller.foundDoctors[index].name
                                      .toString(),
                                  style: TextStyles.title.bold),
                              subtitle: Text(
                                controller.foundDoctors[index].information
                                    .toString(),
                                style: TextStyle(fontSize: 14.sp),
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Get.to(DoctorDetailView(
                                      doctor: controller.foundDoctors[index]));
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30.sp,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ));
                    }),
                  ]),
                );
        }));
  }
}
