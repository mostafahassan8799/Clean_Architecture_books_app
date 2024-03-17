import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() async {
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const Bookly(), // Wrap your app
  ));
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
    );
  }
}
