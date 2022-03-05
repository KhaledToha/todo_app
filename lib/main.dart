import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/toda_layout.dart';
import 'package:todo_app/layout/todo_cubit/cubit.dart';
import 'package:todo_app/layout/todo_cubit/states.dart';
import 'package:todo_app/shared/local/cache_helper.dart';

import 'component/bloc_observier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyApp app = MyApp(true);

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

bool isDark = CacheHelper.getData(key: 'isDark')?? false;

  runApp(MyApp(true));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..ChangeToDark(fromShared: isDark),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) {},
          builder: (context, states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              //theme: themeLight,
              //darkTheme: themeDark,
              themeMode: ThemeMode.light,
              home: HomeLayout(),
            );
          },
        ));
  }
}
