import 'dart:ffi';

import 'package:app_dentristy_mobile/core/widget/side_menu.dart';
import 'package:app_dentristy_mobile/feature/service_list/view/service_detail_view.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:app_dentristy_mobile/utils/rive_utils.dart';
import 'package:flutter/src/painting/gradient.dart' as gradient;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:html/parser.dart' show parse;

import '../../../core/secure_storage.dart';
import '../../../core/system_state.dart';
import '../../../core/widget/footer.dart';
import '../../../core/widget/menu_btn.dart';
import '../../../core/widget/search_box.dart';
import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';
import '../../service_list/controller/service_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _scalAnimation;

  late String userName;
  var systemState = Get.find<SystemState>();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    _scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedPositioned(
          child: const SideMenu(),
          width: 288,
          left: isSideMenuClosed ? -288 : 0,
          height: MediaQuery.of(context).size.height,
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_animation.value - 30 * _animation.value * 3.14159 / 180),
          child: Transform.translate(
            offset: Offset(_animation.value * 288, 0),
            child: Transform.scale(
              scale: _scalAnimation.value,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: getBody(context)),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          top: 10,
          left: isSideMenuClosed ? 0 : 220,
          child: MenuBtn(
            riveOnInit: (artboard) {
              StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachineName: "State Machine");
              isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
              isSideBarClosed.value = true;
            },
            press: () {
              isSideBarClosed.value = !isSideBarClosed.value;
              if (isSideMenuClosed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed = isSideBarClosed.value;
              });
            },
          ),
        ),
      ]),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody(context) {
    final controller = Get.find<ServiceController>();
    var listCategory = [
      {
        "name": "Bác sĩ",
        "color": const Color.fromARGB(255, 221, 240, 221),
        "path": "/doctor",
        "icon": const Icon(
          Icons.man,
          size: 50,
          color: LightColor.lightBlue,
        ),
      },
      {
        "name": "Dịch vụ",
        "color": const Color.fromARGB(255, 240, 226, 210),
        "path": "/service",
        "icon": const Icon(
          Icons.medical_services,
          size: 50,
          color: LightColor.lightBlue,
        ),
      },
      {
        "name": "Bảng giá",
        "color": const Color.fromARGB(255, 232, 201, 238),
        "path": "/price_list",
        "icon": const Icon(
          Icons.list_alt,
          size: 50,
          color: LightColor.lightBlue,
        ),
      },
      {
        "name": "Bài đăng",
        "color": const Color.fromARGB(255, 201, 228, 238),
        "path": "/news_list",
        "icon": const Icon(
          Icons.chrome_reader_mode,
          size: 50,
          color: LightColor.lightBlue,
        ),
      },
    ];

    return Obx(() {
      return controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Material(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        gradient: gradient.LinearGradient(
                            colors: [
                              LightColor.lightBlue.withOpacity(0.8),
                              LightColor.lightBlue
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15.r),
                          bottomRight: Radius.circular(15.r),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 37.h, left: 16.w, right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Obx(() {
                                systemState.changeUserName();
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          150.w,
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              '${systemState.userName.value == "" ? "Chào bạn " : "Chào " + systemState.userName.value}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17.sp),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.waving_hand,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              CircleAvatar(
                                radius: 25.r,
                                backgroundImage:
                                    AssetImage('${systemState.userName.value == "" ? "assets/image/user.jpg" : "assets/image/profile_2.jpg"}'),
                              )
                            ],
                          ),
                          Text('Luôn chăm sóc ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  color: Colors.white)),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text('sức khỏe của bạn',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp,
                                  color: Colors.white)),
                          SizedBox(
                            height: 10.h,
                          ),
                          const SearchBox(),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Categories',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(listCategory.length, (index) {
                              return Container(
                                width: 70.w,
                                height: 90.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0.r))),
                                    onPressed: () {
                                      Get.toNamed(listCategory[index]['path']
                                          .toString());
                                    },
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 5.h),
                                            child: listCategory[index]['icon']
                                                as Icon,
                                          ),
                                          Flexible(
                                              child: Text(
                                            listCategory[index]['name']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ))
                                        ],
                                      ),
                                    )),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Top dịch vụ',
                                  style: TextStyle(
                                      fontSize: 20.h,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.toNamed('/service');
                                    },
                                    child: Text(
                                      "Xem tất cả",
                                      style: TextStyle(
                                          fontSize: 16.h,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ))
                              ],
                            ),
                          ),
                          Column(
                            children: List.generate(3, (index) {
                              return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
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
                                      onTap: () {
                                        Get.to(ServiceDetailView(
                                            service:
                                                controller.listService[index]));
                                      },
                                      title: Padding(
                                        padding:
                                             EdgeInsets.only(bottom: 5.h),
                                        child: Text(
                                            controller.listService[index].name
                                                .toString(),
                                            style: TextStyles.title.bold),
                                      ),
                                      subtitle: Text(
                                        parse(controller.foundServices[index]
                                                .information)
                                            .documentElement
                                            .text,
                                        style: TextStyle(fontSize: 13.sp),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ));
                            }),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
