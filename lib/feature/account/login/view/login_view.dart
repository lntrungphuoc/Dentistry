import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
            height: 15,
          ),
          const Text(
            "Sử dụng số CCCD/CMND để truy cập vào sổ sức khỏe",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
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
                                  : const FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 18,
                                    )),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'Mật khẩu'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                      onPressed: () {
                        controller.login();
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 55)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 14))),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
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
            height: 15,
          ),
          const Text(
            "Sử dụng tên tài khoản để truy cập",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: userLoginController.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
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
                                  : const FaIcon(
                                      FontAwesomeIcons.eyeSlash,
                                      size: 18,
                                    )),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(0),
                          labelText: 'Mật khẩu'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextButton(
                      onPressed: () {
                        userLoginController.login();
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 55)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 14))),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
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
                  const Icon(
                    Icons.local_hospital,
                    size: 70,
                    color: Color.fromARGB(255, 9, 136, 239),
                  ),
                  const Text(
                    'HÍ AE',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _tabBar,
                  SizedBox(
                    height: 290,
                    child: TabBarView(children: [_tabCustomer, _tabEmployee]),
                  ),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Text('Hoặc'),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/image/icons8-google.svg',
                          height: 30,
                        ),
                        label: const Text(
                          "Đăng nhập bằng tài khoản Google",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/image/icons8-facebook.svg',
                          height: 30,
                        ),
                        label: const Text(
                          "Đăng nhập bằng tài khoản Facebook",
                          style: TextStyle(color: Colors.black, fontSize: 16),
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
