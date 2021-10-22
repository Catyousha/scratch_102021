import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratch_102021/getx_intro/routes/app_pages.dart';

import 'shared/logger/logger_utils.dart';

class GetxIntroApp extends StatelessWidget {
  const GetxIntroApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      getPages: AppPages.routes,
    );
  }
}