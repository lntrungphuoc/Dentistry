import 'dart:async';

import 'package:app_dentristy_mobile/core/widget/search_box.dart';
import 'package:app_dentristy_mobile/feature/price_list/controller/price_list_controller.dart';
import 'package:app_dentristy_mobile/feature/price_list/view/price_list_detail_view.dart';
import 'package:app_dentristy_mobile/model/price_list.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../theme/light_color.dart';
import '../../../theme/text_styles.dart';

class PriceListView extends StatefulWidget {
  const PriceListView({super.key});

  @override
  State<PriceListView> createState() => _PriceListViewState();
}

class _PriceListViewState extends State<PriceListView> {
  Timer? _debounce;
  _runFilter(String value, PriceListController controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      List<PriceList> result = [];
      if (value.isEmpty) {
        result = controller.listPriceList;
      } else {
        result = controller.listPriceList.value
            .where((priceList) =>
                priceList.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }

      setState(() {
        controller.foundPriceLists = result.obs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PriceListController>();
    return Scaffold(
        backgroundColor: LightColor.background,
        appBar: AppBar(
          backgroundColor: LightColor.background,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            "Bảng giá",
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
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
                      Column(
                        children: List.generate(
                            controller.foundPriceLists.length, (index) {
                          return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
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
                                    Get.to(PriceListDetailView(
                                        priceList:
                                            controller.foundPriceLists[index]));
                                  },
                                  title: Text(
                                      controller.foundPriceLists[index].title
                                          .toString(),
                                      style: TextStyles.title.bold),
                                  subtitle: Text(
                                    controller.foundPriceLists[index].content
                                        .toString(),
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 30,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ));
                        }),
                      ),
                    ],
                  ),
                );
        }));
  }
}
