import 'package:app_dentristy_mobile/model/news.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/footer.dart';
import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';
import '../../../theme/theme.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(news.thumbnail), fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        news.title,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 193, 193, 193),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(formatter.format(news.createdDate))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 193, 193, 193),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('103')
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  thickness: .3,
                  color: LightColor.grey,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(news.content, style: TextStyle(fontSize: 18),)
              ]),
            )
          ]),
        ),
      ),
      bottomNavigationBar: getFooter(),
    );
  }
}
