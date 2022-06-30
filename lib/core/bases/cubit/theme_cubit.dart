import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);
  void toggleTheme(){
    emit(!state);
  }
}
