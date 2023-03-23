
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:flutter/material.dart';

import '../../theme/light_color.dart';
import '../../theme/text_styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(top: 15, bottom: 20),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: LightColor.grey.withOpacity(.3),
            blurRadius: 15,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: TextField(
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
                      borderRadius: BorderRadius.circular(13))),
        ),
      ),
    );
  }
}
