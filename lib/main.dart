import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:music_app/generated/l10n.dart';
import 'package:music_app/internet_bloc/internet_bloc.dart';
import 'package:music_app/ui/track_list/cubit/track_list_cubit.dart';
import 'package:music_app/ui/track_list/track_list.dart';
import 'package:music_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const AppLocalizationDelegate().supportedLocales,
          onGenerateRoute: Routes.generateRoutes,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BlocProvider(
            create: (context) => TrackListCubit(),
            child: const TrackListWidget(),
          )
      ),
    );
  }
}
