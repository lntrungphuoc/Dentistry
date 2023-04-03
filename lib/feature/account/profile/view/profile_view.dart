import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../core/secure_storage.dart';
import '../../../../core/system_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var systemState = Get.find<SystemState>();
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "Thông tin tài khoản",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 90.w,
                    height: 90.h,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(120.r),
                        child: const Image(
                            image: AssetImage("assets/image/profile_2.jpg"))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: LightColor.lightBlue),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() {
                systemState.changeUserName();
                return Text(
                  systemState.userName.value.toUpperCase(),
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 180.w,
                height: 45.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: LightColor.lightBlue,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r))),
                    onPressed: () {},
                    child: const Text(
                      'Thay đổi thông tin',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              ProfileMenuWidget(
                title: "Cài đặt",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Thông tin tài khoản",
                icon: Icons.person,
                onPress: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(140.w, 45.h),
                    backgroundColor: Colors.red,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r))),
                onPressed: () async {
                  await SecureStorage.logOut();
                  var systemState = Get.put(SystemState());
                  systemState.changeUserName();
                  systemState.changeTab(0.obs);
                  Get.toNamed("/home");
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: Text(
                  "Đăng xuất",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              )
              // ProfileMenuWidget(
              //   title: "Đăng xuất",
              //   icon: Icons.logout,
              //   textColor: Colors.red,
              //   endIcon: false,
              //   onPress: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: LightColor.lightBlue.withOpacity(0.1)),
        child: Icon(
          icon,
          color: LightColor.lightBlue,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      trailing: endIcon
          ? Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18.sp,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
