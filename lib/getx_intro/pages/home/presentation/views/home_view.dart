// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/primary_button.dart';
import '../../../../shared/styles/text_style.dart';
import '../../../../widgets/page_background.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
        imageSrc:
            "https://images.pexels.com/photos/3902882/pexels-photo-3902882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Covid Overview'),
            backgroundColor: Colors.white10,
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: controller.obx((state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100),
                  const Text('Total Confirmed', style: textSize30),
                  Text('${state!.global.totalConfirmed}',
                      style: textSize45Bold),
                  const SizedBox(height: 10),
                  const Text('Total Death', style: textSize30),
                  Text('${state.global.totalDeaths}', style: textSize45Bold),
                  const SizedBox(height: 10),
                  const Text('Total Recovered', style: textSize30),
                  Text('${state.global.totalRecovered}', style: textSize45Bold),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    text: 'Fetch Country',
                    onPressed: () async {
                      final data =
                          await Get.rootDelegate.toNamed('/home/country');
                      print('DATA: $data');
                    },
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
