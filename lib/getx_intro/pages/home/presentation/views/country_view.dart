import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/page_background.dart';
import '../controllers/home_controller.dart';

class CountryView extends GetView<HomeController> {
  const CountryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      imageSrc:
          "https://images.pexels.com/photos/3902882/pexels-photo-3902882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('corona_by_country'.tr),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: controller.state!.countries.length,
            itemBuilder: (context, index) {
              final country = controller.state!.countries[index];
              return ListTile(
                onTap: () {
                  Get.rootDelegate.toNamed('/home/country/details?id=$index');
                },
                trailing: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://flagpedia.net/data/flags/normal/${country.countryCode.toLowerCase()}.png"),
                ),
                title: Text(country.country),
                subtitle: Text(
                  '${'total_infecteds'}: ${' ${country.totalConfirmed}'}',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
