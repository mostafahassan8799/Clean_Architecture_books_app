import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/cubit%20featured%20books/featured_books_cubit.dart';
import 'package:bookly/core/utils/functions/setup_service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(FetchFeaturedBooksUseCase(
            serviceLocator.get<HomeRepoImpl>(),
          )),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
