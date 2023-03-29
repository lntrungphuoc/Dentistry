import 'package:app_dentristy_mobile/core/secure_storage.dart';
import 'package:app_dentristy_mobile/core/widget/side_menu_tile.dart';
import 'package:app_dentristy_mobile/model/rive_assets.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../utils/rive_utils.dart';
import '../system_state.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var user = {"name": "John Wick", "phoneNumber": "093213942"};
  var systemState = Get.put(SystemState());
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        width: 288,
        height: double.infinity,
        color: LightColor.lightBlue,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  title: Obx(() {
                    systemState.changeUserName();
                    return Text(
                      '${systemState.userName.value}',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                ...sideMenus.map((menu) => SideMenuTile(
                      menu: menu,
                      riveOnInit: (artboard) {
                        StateMachineController controller =
                            RiveUtils.getRiveController(artboard,
                                stateMachineName: menu.stateMachineName);
                        menu.input = controller.findSMI("active") as SMIBool;
                      },
                      press: () {
                        menu.input!.change(true);
                        Future.delayed(const Duration(seconds: 1), () {
                          menu.input!.change(false);
                        });
                        setState(() {
                          selectedMenu = menu;
                        });
                      },
                      isActive: selectedMenu == menu,
                    ))
              ],
            ),
          ],
        )),
      )),
    );
  }
}
