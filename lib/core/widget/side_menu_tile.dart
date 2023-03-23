import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/rive.dart';

import '../../model/rive_assets.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile(
      {super.key,
      required this.press,
      required this.riveOnInit,
      required this.isActive,
      required this.menu});

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;
  final RiveAsset menu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            isActive ? Positioned(
              height: 56,
              width: 288,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ) : SizedBox(),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
