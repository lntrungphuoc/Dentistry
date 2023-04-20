import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/text_styles.dart';
import '../../../theme/theme.dart';

class DoctorDetailView extends StatelessWidget {
  const DoctorDetailView({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25.sp).bold;
    if (AppTheme.fullWidth(context) < 393.w) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23.sp).bold;
    }
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(doctor.avatarUrl), fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 133, 197, 246).withOpacity(0.9),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const BackButton()],
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Chuyên ngành',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  'Răng hàm mặt',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Đánh giá',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4.7',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 16.sp,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bác sĩ',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            this.doctor.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.h),
                          )
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      const Divider(
                        thickness: .3,
                        color: LightColor.grey,
                      ),
                      Text("Thông tin", style: titleStyle).vP16,
                      Text(
                        this.doctor.information,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: LightColor.grey.withAlpha(150)),
              child: const Icon(
                Icons.call,
                color: Colors.white,
              ),
            ).ripple(
              () {},
              borderRadius: BorderRadius.circular(10.r),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              height: 45.h,
              width: 45.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: LightColor.grey.withAlpha(150)),
              child: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
            ).ripple(
              () {},
              borderRadius: BorderRadius.circular(10.r),
            ),
            SizedBox(
              width: 15.w,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
              ),
              onPressed: () {
                Get.toNamed('/make_appointment');
              },
              child: Text(
                "Đặt lịch hẹn",
                style: TextStyles.titleNormal.white,
              ).p(10),
            )
          ],
        ),
      ),
    );
  }
}
