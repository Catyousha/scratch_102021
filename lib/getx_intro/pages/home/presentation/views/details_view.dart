import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/styles/text_style.dart';
import '../../../../widgets/page_background.dart';
import '../controllers/home_controller.dart';

class DetailsView extends GetView<HomeController> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parameter = Get.rootDelegate.parameters;
    final country = controller.getCountryById(parameter['id'] ?? '');

    return PageBackground(
      imageSrc:
          "https://flagpedia.net/data/flags/normal/${country.countryCode.toLowerCase()}.png",
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text('details'.tr),
            backgroundColor: Colors.black12,
            elevation: 0,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  country.country,
                  style: textSize45Bold,
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'total_confirmed',
                  style: textSize25,
                ),
                Text(
                  '${country.totalConfirmed}',
                  style: textSize45Bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'total_deaths',
                  style: textSize25,
                ),
                Text(
                  '${country.totalDeaths}',
                  style: textSize35Bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'total_recovered',
                  style: textSize25,
                ),
                Text(
                  '${country.totalRecovered}',
                  style: textSize35Bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
