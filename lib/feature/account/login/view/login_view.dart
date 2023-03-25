import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool hidden = true;
  var controller = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    hidden = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  "Sử dụng số CCCD/CMND để truy cập tài khoản của bạn",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: controller.loginFormKey,
                  child: SingleChildScrollView(
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
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(() {
                                            hidden = !hidden;
                                          }),
                                      icon: hidden
                                          ? Icon(Icons.remove_red_eye_outlined)
                                          : FaIcon(
                                              FontAwesomeIcons.eyeSlash,
                                              size: 18,
                                            )),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  labelText: 'Mật khẩu'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                              alignment: Alignment.center,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 55),
                                  ),
                                  onPressed: () {
                                    controller.login();
                                  },
                                  child: const Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ))),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text('Hoặc'),
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
                        'assets/image/icons8-instagram.svg',
                        height: 30,
                      ),
                      label: const Text(
                        "Đăng nhập bằng tài khoản Instagram",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
