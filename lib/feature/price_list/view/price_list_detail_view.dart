import 'package:app_dentristy_mobile/model/price_list.dart';
import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../theme/text_styles.dart';

class PriceListDetailView extends StatelessWidget {
  const PriceListDetailView({super.key, required this.priceList});

  final PriceList priceList;

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    return Scaffold(
      backgroundColor: LightColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Chi tiết bảng giá",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Text(
                  priceList.title,
                  style: titleStyle,
                ).vP16,
                SizedBox(
                  height: 10,
                ),
                Text(
                  priceList.content,
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 20,),
                Divider(),
                Text('Dưới đây là đoạn văn dài cho đẹp', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Trái đất mất hàng tỉ năm để hình thành và cũng mất hàng triệu năm để sự sống được nhen nhóm và tồn tại. Nhưng trải qua hàng ngàn năm bồi đắp, sự sống ấy lại đang vô tình mất đi do chính những người đang mỉm cười vì sự sống đó.Đã đến lúc mà con người phải ý thức được sâu sắc vận mệnh và hành động của mình. Nhất là khi chúng ta còn đang sống trong thời đại của khoa học và kỹ thuật tiên tiến, càng phải ý thức hơn về việc đó. Trẻ em là người sẽ quyết định tương lai, vị thế của mỗi dân tộc trên trường quốc tế. Qua vấn đề bảo vệ, chăm sóc trẻ em, chúng ta có thể nhận ra được trình độ văn minh và phần nào bản chất của một xã hội", style: TextStyle(fontSize: 16),),
                Text("Trái đất mất hàng tỉ năm để hình thành và cũng mất hàng triệu năm để sự sống được nhen nhóm và tồn tại. Nhưng trải qua hàng ngàn năm bồi đắp, sự sống ấy lại đang vô tình mất đi do chính những người đang mỉm cười vì sự sống đó.Đã đến lúc mà con người phải ý thức được sâu sắc vận mệnh và hành động của mình. Nhất là khi chúng ta còn đang sống trong thời đại của khoa học và kỹ thuật tiên tiến, càng phải ý thức hơn về việc đó. Trẻ em là người sẽ quyết định tương lai, vị thế của mỗi dân tộc trên trường quốc tế. Qua vấn đề bảo vệ, chăm sóc trẻ em, chúng ta có thể nhận ra được trình độ văn minh và phần nào bản chất của một xã hội", style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: LightColor.grey.withAlpha(150)),
                child: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
              ).ripple(
                () {},
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: LightColor.grey.withAlpha(150)),
                child: const Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
              ).ripple(
                () {},
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(
                width: 15,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Get.toNamed('/make_appointment');
                },
                child: Text(
                  "Đặt lịch hẹn",
                  style: TextStyles.titleNormal.white,
                ).p(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
