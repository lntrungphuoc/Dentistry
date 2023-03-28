import 'dart:async';

import 'package:app_dentristy_mobile/model/doctor.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';
import '../controller/doctor_controller.dart';

class ListDoctorView extends StatefulWidget {
  const ListDoctorView({super.key});

  @override
  State<ListDoctorView> createState() => _ListDoctorViewState();
}

class _ListDoctorViewState extends State<ListDoctorView> {
  Timer? _debounce;
  _runFilter(String value, DoctorController controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      List<Doctor> result = [];
      if (value.isEmpty) {
        result = controller.listDoctor;
      } else {
        result = controller.listDoctor.value
            .where((doctor) =>
                doctor.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }

      setState(() {
        controller.foundDoctors = result.obs;
      });
    });
  }

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
          title: const Text(
            "Bác Sĩ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 55,
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(13)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: LightColor.grey.withOpacity(.3),
                              blurRadius: 15,
                              offset: const Offset(5, 5),
                            )
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) => _runFilter(value, controller),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            border: InputBorder.none,
                            hintText: "Tìm kiếm",
                            hintStyle: TextStyles.body.subTitleColor,
                            suffixIcon: SizedBox(
                                width: 50,
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
                    ...List.generate(controller.foundDoctors.length, (index) {
                      return Container(
                          height: 100,
                          alignment: Alignment.center,
                          margin:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              leading: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
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
                              title: Text(
                                  controller.foundDoctors[index].name.toString(),
                                  style: TextStyles.title.bold),
                              subtitle: Text(
                                controller.foundDoctors[index].information
                                    .toString(),
                                style: const TextStyle(fontSize: 15),
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
                  ]),
                );
        }));
  }
}
