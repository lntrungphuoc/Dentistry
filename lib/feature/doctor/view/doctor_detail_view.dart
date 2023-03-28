import 'package:app_dentristy_mobile/theme/extention.dart';
import 'package:app_dentristy_mobile/theme/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../../theme/text_styles.dart';
import '../../../theme/theme.dart';

class DoctorDetailView extends StatelessWidget {
  const DoctorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23).bold;
    }
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/doctor_detail.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 133, 197, 246).withOpacity(0.9),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                      const Color.fromARGB(255, 220, 234, 245).withOpacity(0),
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const BackButton()],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Chuyên ngành',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Răng hàm mặt',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Đánh giá',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '4.7',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Bác sĩ',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Nguyen Van ABC',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: .3,
                        color: LightColor.grey,
                      ),
                      Row(
                        children: [
                          Text("Thông tin", style: titleStyle).vP16,
                        ],
                      ),
                      const Text(
                        'Quê em là một ngôi làng nhỏ nằm dưới chân núi. Đứng ở lưng núi là có thể quan sát toàn bộ ngôi làng. Nhìn khắp làng, đâu cũng là màu xanh tươi tràn ngập sức sống. Đó là màu xanh của ruộng lúa đương thì ngon gái thơm nồng hương sữa lúa non.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
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
            )
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.titleStyle,
  });

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
                'https://media.istockphoto.com/id/138205019/photo/happy-healthcare-practitioner.jpg?s=612x612&w=0&k=20&c=b8kUyVtmZeW8MeLHcDsJfqqF0XiFBjq6tgBQZC7G0f0='),
            DraggableScrollableSheet(
                maxChildSize: .8,
                initialChildSize: .6,
                minChildSize: .6,
                builder: (context, scrollController) {
                  return Container(
                    height: AppTheme.fullHeight(context) * .5,
                    padding:
                        const EdgeInsets.only(left: 19, right: 19, top: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: LightColor.background,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'John Wick 4',
                                  style: titleStyle,
                                ),
                                const Spacer(),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      " 4.6",
                                      style: TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Container(
                              child: const Text('Răng hàm mặt'),
                              padding: const EdgeInsets.only(top: 5),
                            ),
                          ),
                          const Divider(
                            thickness: .3,
                            color: LightColor.grey,
                          ),
                          Text("Thông tin", style: titleStyle).vP16,
                          const Text(
                            'Quê em là một ngôi làng nhỏ nằm dưới chân núi. Đứng ở lưng núi là có thể quan sát toàn bộ ngôi làng. Nhìn khắp làng, đâu cũng là màu xanh tươi tràn ngập sức sống. Đó là màu xanh của ruộng lúa đương thì ngon gái thơm nồng hương sữa lúa non.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
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
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
