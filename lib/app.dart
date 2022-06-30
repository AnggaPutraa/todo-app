import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/bases/cubit/theme_cubit.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/page/todo_main_page.dart';

class MyApp extends StatelessWidget {
  final AppTheme myTheme = AppTheme();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => TodoBloc()..add(TodoLoadedEvent())
      ),
      BlocProvider(
        create: (context) => ThemeCubit()
      )
    ],
    child: BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state ? myTheme.lightTheme() : myTheme.darkTheme(),
          darkTheme: myTheme.darkTheme(),
          home: const TodoMainPage(),
        );
      },
    ),
  );
}
