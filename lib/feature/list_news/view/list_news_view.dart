import 'package:app_dentristy_mobile/core/widget/search_box.dart';
import 'package:app_dentristy_mobile/feature/list_news/view/news_detail_view.dart';
import 'package:app_dentristy_mobile/model/news.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/footer.dart';
import '../controller/list_news_controller.dart';

class ListNewsView extends StatelessWidget {
  const ListNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final controller = Get.find<ListNewsController>();
    return Obx(() {
      return controller.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SafeArea(
                  child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h,),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Tin tức',
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    SearchBox(),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'Cập nhật những thông báo cũng như khuyến mãi mới nhất của chúng tôi',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(height: 250.h),
                        items: controller.listNews.map((news) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        news.thumbnail,
                                        fit: BoxFit.cover,
                                        height: 250,
                                      ),
                                    ),
                                    Container(
                                      width: size.width,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xCC000000),
                                                Color(0x00000000),
                                                Color(0x00000000),
                                                Color(0xCC000000),
                                              ])),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, bottom: 40),
                                        child: Text(
                                          news.title,
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(controller.listNews.length,
                              (index) {
                            News news = controller.listNews[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(NewsDetailView(news: news));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.grey[200]),
                                child: Row(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.network(
                                      news.thumbnail,
                                      height: 100.h,
                                      width: 100.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                          child: Text(
                                        getTruncatedTitle(news.title, 60),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp),
                                      )),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            size: 15.sp,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(formatter.format(news.createdDate))
                                        ],
                                      )
                                    ],
                                  ))
                                ]),
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              )),
              bottomNavigationBar: getFooter(),
            );
    });
  }

  String getTruncatedTitle(String text, int number) {
    return text.length > number ? text.substring(0, number) + '...' : text;
  }
}
