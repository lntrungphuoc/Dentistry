import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';
import '../controller/doctor_controller.dart';

class ListDoctorView extends StatelessWidget {
  const ListDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();
    return Scaffold(
        backgroundColor: LightColor.background,
        appBar: AppBar(
          backgroundColor: LightColor.background,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Text(
            "Bác Sĩ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                child: Column(
                    children: List.generate(controller.listDoctor.length, (index) {
                      return Container(
                          height: 100,
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(4, 4),
                                blurRadius: 10,
                                color: LightColor.grey.withOpacity(.2),
                              ),
                              BoxShadow(
                                offset: Offset(-3, 0),
                                blurRadius: 15,
                                color: LightColor.grey.withOpacity(.1),
                              )
                            ],
                          ),
                          child: Flexible(
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                              leading: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 90,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    'assets/image/profile_2.jpg',
                                    height: 90,
                                    width: 80,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              title: Text(controller.listDoctor[index].name.toString(),
                                  style: TextStyles.title.bold),
                              subtitle: Text(
                                controller.listDoctor[index].information.toString(),
                                style: TextStyle(fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Get.toNamed('/doctor_detail');
                                },
                                icon: Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ));
                    }),
                  ),
              );
        }));
  }
}
