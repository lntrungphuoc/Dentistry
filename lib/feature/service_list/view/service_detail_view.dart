import 'package:app_dentristy_mobile/model/service.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/text_styles.dart';

class ServiceDetailView extends StatelessWidget {
  const ServiceDetailView({super.key, required this.service});

  final Service service;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25.sp).bold;
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          service.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                // Text(
                //   service.name,
                //   style: titleStyle,
                // ).vP16,
                SizedBox(
                  height: 10.h,
                ),
                Html(
                  data: service.information,
                  defaultTextStyle: TextStyle(fontSize: 14.sp),
                ),
                // Text(
                //   service.information,
                //   style: TextStyle(fontSize: 16),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
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
                  borderRadius: BorderRadius.circular(10.r),
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
              ).p(10.sp),
            ),
          ],
        ),
      ),
    );
  }
}
