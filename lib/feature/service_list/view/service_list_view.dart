import 'dart:async';
import 'dart:convert';

import 'package:app_dentristy_mobile/core/widget/search_box.dart';
import 'package:app_dentristy_mobile/feature/service_list/view/service_detail_view.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:app_dentristy_mobile/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

import '../../../model/service.dart';
import '../controller/service_controller.dart';

class ServiceListView extends StatefulWidget {
  const ServiceListView({super.key});

  @override
  State<ServiceListView> createState() => _ServiceListViewState();
}

class _ServiceListViewState extends State<ServiceListView> {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  Timer? _debounce;

  _runFilter(String value, ServiceController controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      List<Service> result = [];
      if (value.isEmpty) {
        result = controller.listService;
      } else {
        result = controller.listService.value
            .where((service) =>
                service.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }

      setState(() {
        controller.foundServices = result.obs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServiceController>();
    return Scaffold(
        backgroundColor: LightColor.background,
        appBar: AppBar(
          backgroundColor: LightColor.background,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            "Dịch Vụ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                onRefresh: () => controller.RefreshData(),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          height: 55.h,
                          margin: EdgeInsets.only(top: 15.h, bottom: 20.h),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: LightColor.grey.withOpacity(.3),
                                blurRadius: 15,
                                offset: const Offset(5, 5),
                              )
                            ],
                          ),
                          child: TextField(
                            onChanged: (value) =>
                                _runFilter(value, controller),
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
                                              BorderRadius.circular(13))),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                            controller.foundServices.length, (index) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 16.h),
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
                                            controller.foundServices[index]));
                                  },
                                  title: Padding(
                                    padding: EdgeInsets.only(bottom: 3.h),
                                    child: Text(
                                        controller.foundServices[index].name
                                            .toString(),
                                        style: TextStyles.title.bold),
                                  ),
                                  subtitle:
                                      // Html(
                                      //   data: controller
                                      //       .foundServices[index].information,
                                      //   defaultTextStyle: const TextStyle(fontSize: 15),
                                      // ),
                                      Text(
                                    parse(controller
                                            .foundServices[index].information)
                                        .documentElement
                                        .text,
                                    style: TextStyle(fontSize: 14.sp),
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
                      ),
                    ],
                  ),
                ),
              );
        }));
  }
}
