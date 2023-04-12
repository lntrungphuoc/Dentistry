import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/customer_login_controller.dart';
import '../controller/user_login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hidden = true;
  var controller = CustomerLoginController();

  var userLoginController = UserLoginController();

  @override
  void initState() {
    // TODO: implement initState
    hidden = true;
    super.initState();
  }

  TabBar get _tabBar => const TabBar(
        tabs: [
          Tab(
            text: "Khách hàng",
          ),
          Tab(
            text: "Nhân viên",
          ),
        ],
        labelColor: Colors.black,
      );

  Column get _tabCustomer => Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const Text(
            "Sử dụng số CCCD/CMND để truy cập vào sổ sức khỏe",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20.h,
          ),
          Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.only(top: 3.h),
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
                      controller: controller.userNameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0),
                          labelText: 'CCCD/CMND'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.only(top: 3.h),
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
                      controller: controller.passwordController,
                      obscureText: hidden,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hidden = !hidden;
                                  }),
                              icon: hidden
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 18.sp,
                                    )),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'Mật khẩu'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TextButton(
                      onPressed: () {
                        controller.login();
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 50.h)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.r))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 14.h))),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      )),
                )
              ],
            ),
          ),
        ],
      );

  Column get _tabEmployee => Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const Text(
            "Sử dụng tên tài khoản để truy cập",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20.h,
          ),
          Form(
            key: userLoginController.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.only(top: 3.h),
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
                      controller: userLoginController.userNameController,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0),
                          labelText: 'Tên tài khoản'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.only(top: 3.h),
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
                      controller: userLoginController.passwordController,
                      obscureText: hidden,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () => setState(() {
                                    hidden = !hidden;
                                  }),
                              icon: hidden
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 18.sp,
                                    )),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'Mật khẩu'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                      onPressed: () {
                        userLoginController.login();
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 50.h)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.r))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 14.h))),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      )),
                )
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset("assets/image/trans_logo.png", width: 150.w,),
                  SizedBox(height: 15.h,),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _tabBar,
                  SizedBox(
                    height: 280.h,
                    child: TabBarView(children: [_tabCustomer, _tabEmployee]),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Divider(),
                      )),
                      Text('Hoặc'),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Divider(),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r))),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/image/icons8-google.svg',
                          height: 30.h,
                        ),
                        label: Text(
                          "Đăng nhập bằng tài khoản Google",
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.r))),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/image/icons8-facebook.svg',
                          height: 30.h,
                        ),
                        label: Text(
                          "Đăng nhập bằng tài khoản Facebook",
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        )),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: OutlinedButton.icon(
                  //       style: OutlinedButton.styleFrom(
                  //           fixedSize:
                  //               Size(MediaQuery.of(context).size.width, 55),
                  //           shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(14))),
                  //       onPressed: () {},
                  //       icon: SvgPicture.asset(
                  //         'assets/image/icons8-instagram.svg',
                  //         height: 30,
                  //       ),
                  //       label: const Text(
                  //         "Đăng nhập bằng tài khoản Instagram",
                  //         style: TextStyle(color: Colors.black, fontSize: 16),
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
