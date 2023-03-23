import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../system_state.dart';

getFooter() {
  var state = Get.put(SystemState());
  var tabItems = [
    {
      "icon": Icons.home_outlined,
      "size": 30.0,
      "url": "/home",
      "name": "Trang chủ"
    },
    {
      "icon": Icons.calendar_month,
      "size": 30.0,
      "url": "/make_appointment",
      "name": "Đặt lịch"
    },
    {
      "icon": Icons.book_outlined,
      "size": 30.0,
      "url": "/health_book",
      "name": "Sổ sức khỏe"
    },
    {
      "icon": Icons.account_circle_outlined,
      "size": 30.0,
      "url": "/login",
      "name": "Tài khoản"
    },
  ];
  return Container(
    height: 70,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]),
    child: Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabItems.length, (index) {
            return Column(
              children: [
                IconButton(
                  icon: Icon(
                    tabItems[index]['icon'] as IconData,
                    color: state.activeTab == index ? Colors.red : Colors.black,
                  ),
                  onPressed: () async {
                    state.changeTab(index.obs);
                    if (index == 3) {
                      if (await SecureStorage.getLoggedInUser() != null) {
                        Get.toNamed("/profile");
                      } else {
                        Get.toNamed(tabItems[index]['url'].toString());
                      }
                    } else {
                      Get.toNamed(tabItems[index]['url'].toString());
                    }
                  },
                ),
                Text(
                  tabItems[index]['name'].toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            );
          })),
    ),
  );
}
